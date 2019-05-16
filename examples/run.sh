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
    --eval_steps=100000 \
    
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
