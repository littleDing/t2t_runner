# -*- encoding=utf8
#
#      Filename: parse_logs.py
#
#        Author: littleding - waigi.ding@gmail.com
#   Description: ---
#        Create: 2019-05-16 22:16:34
# Last modified: 2019-05-29 09:17:31

import logging
import unittest
import sys
import re
import datetime
import pandas as pd
pd.set_option("display.width", 1200)
logging.basicConfig(level=logging.INFO,format="%(asctime)s T%(thread)d %(funcName)s@%(filename)s#%(lineno)d %(levelname)s %(message)s")

def parse_metrics(line, metrics):
  temp = {}
  for key in metrics:
    temp[key] = float(re.sub('.*%s = ([-.\d]*)[,]*.*'%(key), '\\1', line))
  return temp
def parse_ts(line):
  if line.endswith('Z'):
    t = datetime.datetime.strptime(line[-20:-1], '%Y-%m-%dT%H:%M:%S')
  else :
    t = datetime.datetime.strptime(line[-19:], '%Y-%m-%d-%H:%M:%S')
  return t + datetime.timedelta(seconds=3600*8)

def main(fstderr='stderr', fstdout='stdout'):
  metrics = 'global_step,loss,accuracy,accuracy_per_sequence,accuracy_top5,approx_bleu_score,neg_log_perplexity,rouge_2_fscore,rouge_L_fscore'.split(',')
  renames = {
    'global_step' : 'gstep',
    'accuracy_per_sequence' : 'acc_per_seq',
    'accuracy' : 'acc',
    'accuracy_top5' : 'acc_top5',
    'approx_bleu_score' : 'a_bleu',
    'neg_log_perplexity' : 'neg_log_ppl',
    'rouge_2_fscore' : 'rouge2_f',
    'rouge_L_fscore' : 'rougeL_f',
    'train_begin_ts' : 'train_b_ts',
  }
  buff = []
  in_eval = False
  last_step = 0
  for line in open(fstderr):
    line = line.strip()
    if line.find('Adding visible gpu devices') != -1:
      add_gpu_ts = datetime.datetime.strptime(line[:19], '%Y-%m-%d %H:%M:%S')
      if not in_eval :
        train_begin_ts = add_gpu_ts
    if line.find('Starting evaluation at') != -1:
      eval_begin_ts = parse_ts(line)
      in_eval = True
    if line.find('Finished evaluation at') != -1:
      eval_end_ts = parse_ts(line)
      in_eval = False

    if line.find('Saving dict for global step') != -1:
      temp = parse_metrics(line, metrics)
      temp['train_begin_ts'] = train_begin_ts 
      temp['eval_begin_ts'] = eval_begin_ts
      temp['eval_end_ts'] = eval_end_ts
      temp['train_dt'] = round((eval_begin_ts - train_begin_ts).seconds/60.0, 2)
      temp['eval_dt'] = round((eval_end_ts - eval_begin_ts).seconds/60.0, 2)
      temp['steps'] = int(temp['global_step'] - last_step)
      buff.append(temp)
      train_begin_ts = eval_end_ts
      last_step = temp['global_step']

  data = pd.DataFrame(buff)
  data = data[metrics+'train_begin_ts,train_dt,eval_dt,steps'.split(',')]
  data['steps/hour'] = (data.steps / (data.train_dt / 60)).map(int)
  data['tot_hour'] = ((data.train_dt + data.eval_dt).cumsum() / 60).round(2)
  data['global_step'] = data.global_step.map(int)
  data = data.groupby('global_step').head(1)
  data.index = range(data.shape[0])

  BLEU_uncased = []
  BLEU_cased = []
  for line in open(fstdout):
    if line.startswith('BLEU_uncased'):
      BLEU_uncased.append(float(line.split('=')[1].strip()))
      
    if line.startswith('BLEU_cased'):
      BLEU_cased.append(float(line.split('=')[1].strip()))
  data['BLEU_uncased'] = BLEU_uncased
  data['BLEU_cased'] = BLEU_cased
  data = data.rename(columns=renames)

  print data



if __name__ == "__main__":
  main()
