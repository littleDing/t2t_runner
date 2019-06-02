
function datagen_translate_ai_challenger_2018() {
local wdir=translate_ai_challenger_2018
  # put data to translate_ai_challenger_2018/raw_data
  mkdir $wdir/tmp
  cat $wdir/raw_data/ai_challenger_MTEnglishtoChinese_trainingset_20180827.txt | cut -f3 > $wdir/tmp/wmt_enzh_32768k_tok_train.lang1
  cat $wdir/raw_data/ai_challenger_MTEnglishtoChinese_trainingset_20180827.txt | cut -f4 > $wdir/tmp/wmt_enzh_32768k_tok_train.lang2
  mkdir $wdir/tmp/training-parallel-nc-v13
  cp $wdir/tmp/wmt_enzh_32768k_tok_train.lang1 $wdir/tmp/training-parallel-nc-v13/news-commentary-v13.zh-en.en
  cp $wdir/tmp/wmt_enzh_32768k_tok_train.lang2 $wdir/tmp/training-parallel-nc-v13/news-commentary-v13.zh-en.zh
 
  cat $wdir/raw_data/ai_challenger_MTEnglishtoChinese_validationset_20180823_en.sgm | grep "^<seg id" | sed 's/^<seg id="[0-9]*">\(.*\)<\/seg>$/\1/g' | cut -f3- > $wdir/tmp/wmt_enzh_32768k_tok_dev.lang1
  cat $wdir/raw_data/ai_challenger_MTEnglishtoChinese_validationset_20180823_zh.sgm | grep "^<seg id" | sed 's/^<seg id="[0-9]*">\(.*\)<\/seg>$/\1/g'  > $wdir/tmp/wmt_enzh_32768k_tok_dev.lang2
  
}

function run_translate_ai_challenger_2018() {
local problem=translate_enzh_wmt32k
local working_dir=translate_ai_challenger_2018
local hparams_set=transformer_big_single_gpu
local model=transformer
local beam_size=4
local alpha=0.6
local epoch_size=3250

  for i in `seq 50`; do 
    local steps=$((i*epoch_size+epoch_size))
    t2t-trainer \
      --generate_data \
      --problem=$problem \
      --tmp_dir=$working_dir/tmp \
      --data_dir=$working_dir/data \
      --output_dir=$working_dir/model \
      --model=$model \
      --hparams_set=$hparams_set \
      --worker_gpu_memory_fraction=0.95 \
      --worker_gpu=2 \
      --local_eval_frequency=10000 \
      --eval_steps=100000 \
      --train_steps=$steps \
    && decode_and_bleu $problem $working_dir $hparams_set $model $beam_size $alpha zh
  done
}

function datagen_translate_enzh_wmt32k_jieba() {
local fdir=translate_enzh_wmt32k
local tdir=translate_enzh_wmt32k_jieba
local copy_lang=lang1
local cut_lang=lang2
  mkdir -p $tdir/tmp
  cp $fdir/tmp/*.$copy_lang $tdir/tmp/
  for path in $fdir/tmp/*.$cut_lang ; do 
    local tpath=`echo $path | sed "s/$fdir/$tdir/g" `
    cat $path | python -m jieba -d " " > $tpath
  done
}

function run_translate_enzh_wmt32k_jieba() {
local problem=translate_enzh_wmt32k
local working_dir=translate_enzh_wmt32k_jieba
local hparams_set=transformer_big_single_gpu
local model=transformer
local beam_size=4
local alpha=0.6

  for i in `seq 25`; do 
    t2t-trainer \
      --generate_data \
      --problem=$problem \
      --tmp_dir=$working_dir/tmp \
      --data_dir=$working_dir/data \
      --output_dir=$working_dir/model \
      --model=$model \
      --hparams_set=$hparams_set \
      --worker_gpu_memory_fraction=0.95 \
      --worker_gpu=2 \
      --local_eval_frequency=10000 \
      --eval_steps=100000 \
    && decode_and_bleu $problem $working_dir $hparams_set $model $beam_size $alpha zh
  done
}




function run_translate_enzh_wmt32k() {
 t2t-trainer \
    --generate_data \
    --problem=translate_enzh_wmt32k \
    --tmp_dir=translate_enzh_wmt32k/tmp \
    --data_dir=translate_enzh_wmt32k/data \
    --output_dir=translate_enzh_wmt32k/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --worker_gpu_memory_fraction=0.95 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000
   
}

function decode_and_bleu() {
local problem=$1
local working_dir=$2
local hparams_set=$3
local model=$4
local beam_size=$5
local alpha=$6
local decode_type=$7

local decodes=$problem/decode.$model.$hparams_set.$problem.beam$beam_size.alpha$alpha.decodes
local targets=$problem/decode.$model.$hparams_set.$problem.beam$beam_size.alpha$alpha.targets

  CUDA_VISIBLE_DEVICES=1 t2t-decoder \
    --problem=$problem \
    --data_dir=$working_dir/data \
    --output_dir=$working_dir/model \
    --model=$model \
    --hparams_set=$hparams_set \
    --decode_hparams="beam_size=$beam_size,alpha=$alpha" \
    --decode_to_file=$problem/decode \
  && {
    if [ x$decode_type == xzh ] ; then
      cat $decodes | ./tools/chi_char_segment.pl -t plain > $problem/decodes.txt
      cat $targets | ./tools/chi_char_segment.pl -t plain > $problem/targets.txt
    else 
      cp $decodes $problem/decodes.txt
      cp $targets $problem/targets.txt
    fi
  } && t2t-bleu \
    --translation=$problem/decodes.txt \
    --reference=$problem/targets.txt
}

function decode_translate_enzh_wmt32k() {
local problem=translate_enzh_wmt32k
local hparams_set=transformer_big_single_gpu
local model=transformer
local beam_size=4
local alpha=0.6
  
  decode_and_bleu $problem $problem $hparams_set $model $beam_size $alpha zh
}


function run_translate_ende_wmt32k() {
  t2t-trainer \
    --generate_data \
    --problem=translate_ende_wmt32k \
    --tmp_dir=translate_ende_wmt32k/tmp \
    --data_dir=translate_ende_wmt32k/data \
    --output_dir=translate_ende_wmt32k/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --worker_gpu_memory_fraction=0.9 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000 
}

function decode_translate_ende_wmt32k() {
  t2t-decoder \
    --problem=translate_ende_wmt32k \
    --data_dir=translate_ende_wmt32k/data \
    --output_dir=translate_ende_wmt32k/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --decode_hparams="beam_size=4,alpha=0.6" \
    --decode_to_file=translate_ende_wmt32k/translation.en
}

function run_mnist() {
 	CUDA_VISIBLE_DEVICES=0 t2t-trainer \
		--generate_data \
    --tmp_dir=image_mnist/tmp \
		--data_dir=image_mnist/data \
		--output_dir=image_mnist/model \
		--problem=image_mnist \
		--model=shake_shake \
		--hparams_set=shake_shake_quick \
    --worker_gpu_memory_fraction=0.9 \
		--train_steps=1000 \
		--eval_steps=100 

}

$*
