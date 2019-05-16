## running configs
### RTX2080TiX2
```
2019-05-12 19:45:38.178144: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1512] Adding visible gpu devices: 0, 1
2019-05-12 19:45:38.179287: I tensorflow/core/common_runtime/gpu/gpu_device.cc:984] Device interconnect StreamExecutor with strength 1 edge matrix:
2019-05-12 19:45:38.179298: I tensorflow/core/common_runtime/gpu/gpu_device.cc:990]      0 1
2019-05-12 19:45:38.179302: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1003] 0:   N N
2019-05-12 19:45:38.179306: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1003] 1:   N N
2019-05-12 19:45:38.179712: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 9888 MB memory) -> physical GPU (device: 0, name: GeForce RTX 2080 Ti, pci bus id: 0000:01:00.0, compute capability: 7.5)
2019-05-12 19:45:38.179996: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:1 with 9890 MB memory) -> physical GPU (device: 1, name: GeForce RTX 2080 Ti, pci bus id: 0000:02:00.0, compute capability: 7.5)
```

### M40X4
```
2019-05-16 00:16:06.754022: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1511] Adding visible gpu devices: 0, 1, 2, 3
2019-05-16 00:19:15.143020: I tensorflow/core/common_runtime/gpu/gpu_device.cc:982] Device interconnect StreamExecutor with strength 1 edge matrix:
2019-05-16 00:19:15.143092: I tensorflow/core/common_runtime/gpu/gpu_device.cc:988]      0 1 2 3
2019-05-16 00:19:15.143118: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1001] 0:   N Y Y Y
2019-05-16 00:19:15.143142: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1001] 1:   Y N Y Y
2019-05-16 00:19:15.143164: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1001] 2:   Y Y N Y
2019-05-16 00:19:15.143205: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1001] 3:   Y Y Y N
2019-05-16 00:19:15.145083: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 21792 MB memory) -> physical GPU (device: 0, name: Tesla M40 24GB, pci bus id: 0000:84:00.0, compute capability: 5.2)
2019-05-16 00:19:15.145475: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:1 with 21792 MB memory) -> physical GPU (device: 1, name: Tesla M40 24GB, pci bus id: 0000:85:00.0, compute capability: 5.2)
2019-05-16 00:19:15.145761: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:2 with 21792 MB memory) -> physical GPU (device: 2, name: Tesla M40 24GB, pci bus id: 0000:88:00.0, compute capability: 5.2)
2019-05-16 00:19:15.146026: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:3 with 21792 MB memory) -> physical GPU (device: 3, name: Tesla M40 24GB, pci bus id: 0000:89:00.0, compute capability: 5.2)
```


## 2019-05-16-M40X4-transformer_big_single_gpu
running with M40X4
speed at training : INFO:tensorflow:loss = 6.168968, step = 1000 (144.674 sec)

```
t2t-trainer \
  --data_dir=/data/ceph/weijieding/t2t_data/translate_ende_wmt32k/data  \
  --output_dir=/data/ceph/weijieding/t2t_job_translate_en_de  \
  --problem=translate_ende_wmt32k  \
  --model=transformer  \
  --hparams_set=transformer_big_single_gpu  \
  --worker_gpu=4 \
  --keep_checkpoint_max=10 \
  --local_eval_frequency=10000 \
  --eval_steps=100000
```
```
   global_step      loss  accuracy  accuracy_per_sequence  accuracy_top5  approx_bleu_score  neg_log_perplexity  rouge_2_fscore  rouge_L_fscore      train_begin_ts    train_dt   eval_dt    steps   steps/hour
0        10000  2.226390  0.595563               0.027124       0.788824           0.269108           -2.198757        0.341543        0.526697 2019-05-16 00:16:06  247.983333  0.466667  10000.0  2419.517441
1        20000  1.836588  0.645084               0.030719       0.834961           0.317857           -1.827382        0.389439        0.566627 2019-05-16 04:24:33  242.250000  0.450000  10000.0  2476.780186
2        30000  1.681292  0.667445               0.033007       0.852274           0.341603           -1.675679        0.414184        0.585544 2019-05-16 08:27:15  242.183333  0.450000  10000.0  2477.461978
3        40000  1.606250  0.677988               0.033660       0.861473           0.352942           -1.600952        0.424675        0.593904 2019-05-16 12:29:53  242.416667  0.433333  10000.0  2475.077346
4        50000  1.578555  0.681609               0.032026       0.865082           0.356426           -1.572083        0.428613        0.596734 2019-05-16 16:32:44  242.216667  0.466667  10000.0  2477.121035
```


## 2019-05-12-RTX2080TiX2-transformer_big
running with RTX2080TiX2
speed at training : INFO:tensorflow:loss = 5.7481885, step = 1000 (68.233 sec)

```
t2t-trainer \
    --generate_data \
    --problem=translate_ende_wmt32k \
    --tmp_dir=translate_ende_wmt32k/tmp \
    --data_dir=translate_ende_wmt32k/data \
    --output_dir=translate_ende_wmt32k/model \
    --model=transformer \
    --hparams_set=transformer_big \
    --worker_gpu_memory_fraction=0.9 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000 
```
```
    global_step      loss  accuracy  accuracy_per_sequence  accuracy_top5  approx_bleu_score  neg_log_perplexity  rouge_2_fscore  rouge_L_fscore      train_begin_ts    train_dt   eval_dt    steps   steps/hour
0         10000  3.135921  0.475811               0.010265       0.679899           0.169768           -3.089434        0.237228        0.445853 2019-05-12 19:45:38  114.333333  0.466667  10000.0  5247.813411
1         20000  2.573830  0.548814               0.011589       0.748490           0.231489           -2.519966        0.304524        0.503768 2019-05-12 21:40:26  113.450000  0.450000  10000.0  5288.673424
2         30000  2.312953  0.582803               0.013907       0.777479           0.266497           -2.270319        0.340653        0.536396 2019-05-12 23:34:20  113.483333  0.450000  10000.0  5287.119988
3         40000  2.167146  0.601071               0.014901       0.794108           0.283191           -2.133034        0.358019        0.551756 2019-05-13 01:28:16  113.450000  0.450000  10000.0  5288.673424
4         50000  2.101915  0.613147               0.015894       0.803732           0.294986           -2.056614        0.369405        0.560338 2019-05-13 03:22:10  113.433333  0.433333  10000.0  5289.450485
5         60000  2.044890  0.621285               0.017219       0.810525           0.301960           -2.001095        0.377452        0.567099 2019-05-13 05:16:02  113.300000  0.450000  10000.0  5295.675199
6         70000  1.998230  0.627371               0.015563       0.816044           0.308910           -1.958554        0.383957        0.573158 2019-05-13 07:09:47  113.466667  0.450000  10000.0  5287.896592
7         80000  1.951854  0.631899               0.017550       0.820431           0.314015           -1.920991        0.389157        0.577313 2019-05-13 09:03:42  113.500000  0.450000  10000.0  5286.343612
8         90000  1.927707  0.635402               0.015563       0.823557           0.316467           -1.890214        0.391906        0.579056 2019-05-13 10:57:39  113.483333  0.433333  10000.0  5287.119988
9        100000  1.898651  0.639707               0.016556       0.826057           0.324071           -1.867227        0.398739        0.584471 2019-05-13 12:51:34  113.550000  0.433333  10000.0  5284.015852
10       110000  1.878129  0.641947               0.014901       0.828698           0.322481           -1.849590        0.398444        0.585773 2019-05-13 14:45:33  113.583333  0.433333  10000.0  5282.465150
11       120000  1.864883  0.644530               0.016225       0.830373           0.328527           -1.835874        0.403637        0.588762 2019-05-13 16:39:34  113.583333  0.433333  10000.0  5282.465150
12       130000  1.844415  0.646570               0.017881       0.833428           0.331886           -1.815250        0.405965        0.590234 2019-05-13 18:33:35  113.566667  0.433333  10000.0  5283.240387
13       140000  1.824147  0.649566               0.016887       0.835374           0.334365           -1.796644        0.408561        0.592955 2019-05-13 20:27:35  113.550000  0.433333  10000.0  5284.015852
14       150000  1.810193  0.651536               0.016225       0.837084           0.335919           -1.783681        0.410437        0.594945 2019-05-13 22:21:34  113.533333  0.433333  10000.0  5284.791544
15       160000  1.799035  0.651889               0.016887       0.838122           0.337689           -1.774786        0.411822        0.595538 2019-05-14 00:15:32  113.483333  0.433333  10000.0  5287.119988
16       170000  1.790623  0.653116               0.017219       0.839466           0.339544           -1.767156        0.413564        0.597377 2019-05-14 02:09:27  113.500000  0.433333  10000.0  5286.343612
17       180000  1.784680  0.654378               0.017550       0.839690           0.338815           -1.761777        0.413718        0.598355 2019-05-14 04:03:23  113.466667  0.433333  10000.0  5287.896592
18       190000  1.765356  0.656949               0.017881       0.841978           0.342157           -1.747500        0.417077        0.600985 2019-05-14 05:57:17  113.483333  0.433333  10000.0  5287.119988
19       200000  1.767176  0.656666               0.016556       0.841200           0.341292           -1.749028        0.416504        0.599399 2019-05-14 07:51:12  113.500000  0.433333  10000.0  5286.343612
20       210000  1.757216  0.657621               0.017881       0.843075           0.342287           -1.737801        0.417591        0.600545 2019-05-14 09:45:08  113.500000  0.450000  10000.0  5286.343612
21       220000  1.745114  0.660770               0.019205       0.844266           0.347370           -1.725714        0.421912        0.603432 2019-05-14 11:39:05  113.483333  0.450000  10000.0  5287.119988
22       230000  1.735103  0.660935               0.017550       0.846059           0.345067           -1.716074        0.420722        0.603514 2019-05-14 13:33:01  113.500000  0.433333  10000.0  5286.343612
23       240000  1.731471  0.662456               0.018212       0.845740           0.348205           -1.714490        0.423239        0.604634 2019-05-14 15:26:57  113.566667  0.450000  10000.0  5283.240387
24       250000  1.723561  0.663176               0.016556       0.846849           0.349553           -1.705427        0.425249        0.606550 2019-05-14 17:20:58  113.566667  0.433333  10000.0  5283.240387
25       250000  1.723561  0.663176               0.016556       0.846849           0.349553           -1.705427        0.425249        0.606550 2019-05-14 19:14:58    0.100000  0.450000      0.0     0.000000
```
