# -*- encoding=utf8
#
#      Filename: test_tf.py
#
#        Author: littleding - waigi.ding@gmail.com
#   Description: ---
#        Create: 2019-05-12 18:44:21
# Last modified: 2019-05-12 18:45:44

import logging
import unittest
import tensorflow as tf




def main():
  import pandas as pd
  pd.set_option("display.width", 1200)
  logging.basicConfig(level=logging.INFO,format="%(asctime)s T%(thread)d %(funcName)s@%(filename)s#%(lineno)d %(levelname)s %(message)s")

  tf.enable_eager_execution(); 
  print(tf.reduce_sum(tf.random_normal([1000, 1000])))



if __name__ == "__main__":
  main()
