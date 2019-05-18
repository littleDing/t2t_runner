## 2019-05-18-RTX2080TiX2-transformer_big_single_gpu
running with RTX2080TiX2
speed at training : INFO:tensorflow:loss = 6.1338243, step = 1000 (59.497 sec) 
BLEU_uncased =  26.55
BLEU_cased =  26.04

```
t2t-trainer \
    --generate_data \
    --problem=translate_enzh_wmt32k \
    --tmp_dir=translate_enzh_wmt32k/tmp \
    --data_dir=translate_enzh_wmt32k/data \
    --output_dir=translate_enzh_wmt32k/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --worker_gpu_memory_fraction=0.9 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000 
```

```
```
