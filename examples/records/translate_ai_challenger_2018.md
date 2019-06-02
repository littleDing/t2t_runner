## 2019-05-28-RTX2080TiX2-transformer_big_single_gpu
running with RTX2080TiX2
speed at training : INFO:tensorflow:loss = 6.192738, step = 1000 (82.191 sec)

```
t2t-trainer \
    --generate_data \
    --problem=translate_enzh_wmt32k \
    --tmp_dir=translate_ai_challenger_2018/tmp \
    --data_dir=translate_ai_challenger_2018/data \
    --output_dir=translate_ai_challenger_2018/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --worker_gpu_memory_fraction=0.9 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000 
```


```
     gstep      loss       acc  acc_per_seq  acc_top5    a_bleu  neg_log_ppl  rouge2_f  rougeL_f          train_b_ts  train_dt  eval_dt  steps  steps/hour  tot_hour  BLEU_uncased  BLEU_cased
0     6500  3.877613  0.412291     0.002747  0.582229  0.084875    -3.781658  0.169355  0.305565 2019-05-28 09:43:56     90.10     0.65   6500        4328      1.51         17.91       17.91
1     9750  3.434874  0.442898     0.004619  0.636369  0.097064    -3.333052  0.186456  0.324632 2019-05-28 11:21:16     45.72     0.65   3250        4265      2.30         20.76       20.76
2    13000  3.205878  0.460286     0.004619  0.660043  0.105966    -3.115194  0.197241  0.335859 2019-05-28 12:14:42     45.62     0.65   3250        4274      3.08         22.77       22.76
3    16250  3.108620  0.465311     0.004120  0.671598  0.109273    -3.019243  0.200110  0.340777 2019-05-28 13:10:26     45.73     0.65   3250        4264      3.87         22.62       22.62
4    19500  2.915160  0.487421     0.006367  0.695141  0.125018    -2.837353  0.217168  0.356596 2019-05-28 14:04:07     42.70     0.55   3250        4566      4.60         25.07       25.07
5    22750  2.777820  0.500207     0.006991  0.709925  0.132700    -2.715354  0.227482  0.368879 2019-05-28 14:54:15     45.70     0.55   3250        4266      5.38         26.04       26.02
6    26000  2.666168  0.510752     0.006242  0.721318  0.139951    -2.616374  0.236399  0.379411 2019-05-28 15:46:03     41.83     0.65   3250        4661      6.10         27.40       27.39
7    29250  2.603393  0.515808     0.006866  0.731662  0.139050    -2.551838  0.237291  0.380626 2019-05-28 16:34:50     45.58     0.65   3250        4278      6.88         27.59       27.59
8    32500  2.534447  0.523023     0.007491  0.738564  0.150052    -2.492271  0.246931  0.386809 2019-05-28 17:26:00     41.82     0.55   3250        4662      7.60         27.89       27.88
9    35750  2.507474  0.525011     0.006742  0.742217  0.148732    -2.463068  0.244713  0.390982 2019-05-28 18:12:53     45.53     0.63   3250        4282      8.38         28.16       28.15
10   39000  2.460881  0.532529     0.008365  0.749816  0.154937    -2.414502  0.249797  0.394671 2019-05-28 19:03:46     45.62     0.55   3250        4274      9.16         28.33       28.33
11   42250  2.434450  0.535749     0.007990  0.752813  0.154464    -2.391277  0.252504  0.397564 2019-05-28 19:55:01     45.67     0.63   3250        4269      9.94         28.87       28.87
12   45500  2.405802  0.539169     0.007740  0.756072  0.158766    -2.365232  0.255616  0.401266 2019-05-28 20:45:38     42.77     0.55   3250        4559     10.68         29.43       29.40
13   48750  2.391185  0.538806     0.007740  0.757616  0.157125    -2.353095  0.253203  0.398798 2019-05-28 21:33:20     42.70     0.63   3250        4566     11.41         29.33       29.31
14   52000  2.370974  0.543246     0.007865  0.760593  0.160060    -2.332766  0.258824  0.403021 2019-05-28 22:20:48     42.70     0.63   3250        4566     12.14         29.70       29.67
15   55250  2.343643  0.545648     0.007615  0.763570  0.162161    -2.305738  0.260448  0.405205 2019-05-28 23:08:10     45.63     0.65   3250        4273     12.93         29.81       29.80
16   58500  2.332645  0.550209     0.009114  0.766093  0.164557    -2.289157  0.263106  0.405711 2019-05-28 23:58:36     41.80     0.63   3250        4665     13.65         30.26       30.25
17   61750  2.310220  0.549352     0.008989  0.767102  0.163935    -2.273626  0.262923  0.405270 2019-05-29 00:45:15     42.72     0.55   3250        4564     14.38         30.01       30.00
18   65000  2.305185  0.550320     0.008864  0.768384  0.163861    -2.267745  0.261742  0.406278 2019-05-29 01:32:40     41.97     0.65   3250        4646     15.10         30.19       30.19
19   68250  2.287372  0.553721     0.009114  0.770473  0.168949    -2.249559  0.268538  0.410949 2019-05-29 02:19:20     45.62     0.65   3250        4274     15.88         30.51       30.51
20   71500  2.276942  0.554700     0.009363  0.772057  0.169501    -2.237271  0.268388  0.411871 2019-05-29 03:09:45     42.67     0.63   3250        4569     16.61         30.67       30.65
21   74750  2.272398  0.554428     0.009114  0.773652  0.168910    -2.233184  0.268955  0.412220 2019-05-29 03:57:16     45.72     0.55   3250        4265     17.40         30.54       30.52
22   78000  2.252123  0.557122     0.010112  0.774449  0.171100    -2.219171  0.270367  0.414405 2019-05-29 04:47:35     41.98     0.63   3250        4645     18.12         30.80       30.79
23   81250  2.249212  0.556405     0.008989  0.775973  0.172315    -2.214440  0.272883  0.414317 2019-05-29 05:34:34     41.95     0.65   3250        4648     18.84         30.57       30.56
24   84500  2.240835  0.558565     0.010112  0.777133  0.171412    -2.205685  0.272280  0.414009 2019-05-29 06:21:23     41.87     0.63   3250        4657     19.56         30.83       30.82
25   87750  2.227853  0.560311     0.009738  0.778354  0.174530    -2.193156  0.274696  0.416217 2019-05-29 07:08:04     42.68     0.65   3250        4568     20.29         31.06       31.04
26   91000  2.223096  0.560573     0.011610  0.779404  0.173711    -2.188043  0.274894  0.417660 2019-05-29 07:55:37     42.73     0.57   3250        4563     21.03         30.97       30.96
27   94250  2.220381  0.559806     0.010487  0.781906  0.174846    -2.181979  0.274222  0.414719 2019-05-29 08:43:10     45.65     0.55   3250        4271     21.81         31.02       31.01
28   97500  2.207224  0.562501     0.010986  0.781513  0.174856    -2.171468  0.276043  0.417012 2019-05-29 09:33:33     42.02     0.58   3250        4640     22.53         31.16       31.14
29  100750  2.204626  0.562692     0.010112  0.782663  0.176736    -2.170673  0.276210  0.418495 2019-05-29 10:20:15     42.70     0.57   3250        4566     23.26         31.17       31.16
30  104000  2.201437  0.563197     0.009363  0.783107  0.175248    -2.164272  0.277372  0.418043 2019-05-29 11:07:39     45.57     0.55   3250        4279     24.04         31.20       31.18
31  107250  2.193146  0.563116     0.011111  0.783279  0.175313    -2.161332  0.277453  0.417796 2019-05-29 11:58:20     41.90     0.55   3250        4653     24.76         31.20       31.19
32  110500  2.195635  0.562581     0.009738  0.783097  0.176384    -2.160160  0.277386  0.417288 2019-05-29 12:45:04     41.93     0.65   3250        4650     25.48         31.14       31.12
33  113750  2.177781  0.566709     0.011236  0.783783  0.180188    -2.144631  0.279735  0.419935 2019-05-29 13:31:50     42.68     0.65   3250        4568     26.22         31.55       31.54
34  117000  2.180475  0.565932     0.010487  0.784954  0.177876    -2.141991  0.277148  0.416903 2019-05-29 14:18:59     45.62     0.63   3250        4274     27.00         31.45       31.44
35  120250  2.184269  0.566406     0.010487  0.785862  0.177163    -2.141671  0.278748  0.417866 2019-05-29 15:09:26     42.75     0.65   3250        4561     27.73         31.60       31.58
36  123500  2.165329  0.568495     0.010612  0.787023  0.179655    -2.128484  0.281014  0.420798 2019-05-29 15:56:49     42.70     0.63   3250        4566     28.47         31.73       31.71
37  126750  2.169655  0.567193     0.010986  0.786982  0.179152    -2.130726  0.278854  0.419518 2019-05-29 16:44:05     45.63     0.55   3250        4273     29.25         31.41       31.40
38  130000  2.169446  0.568152     0.009613  0.787063  0.178649    -2.132820  0.277783  0.418648 2019-05-29 17:34:08     41.98     0.55   3250        4645     29.97         31.80       31.80
39  133250  2.178417  0.567072     0.009488  0.787285  0.177644    -2.139169  0.278223  0.418046 2019-05-29 18:20:36     41.95     0.65   3250        4648     30.69         31.50       31.48
40  136500  2.167148  0.568091     0.010986  0.787850  0.180450    -2.133588  0.282094  0.421597 2019-05-29 19:07:14     45.65     0.63   3250        4271     31.47         31.68       31.67
41  139750  2.160925  0.568767     0.009738  0.787618  0.180760    -2.125312  0.282090  0.421633 2019-05-29 19:57:30     41.95     0.55   3250        4648     32.19         31.46       31.44
42  143000  2.153070  0.569080     0.010861  0.788849  0.179612    -2.117669  0.281404  0.421951 2019-05-29 20:44:04     42.73     0.63   3250        4563     32.93         31.80       31.79
43  146250  2.151615  0.570311     0.011735  0.788304  0.181476    -2.115679  0.281483  0.421228 2019-05-29 21:31:23     42.68     0.55   3250        4568     33.66         31.81       31.78
44  149500  2.148968  0.569363     0.010237  0.789313  0.179424    -2.115569  0.279319  0.421005 2019-05-29 22:18:55     42.77     0.63   3250        4559     34.40         31.80       31.78
45  152750  2.147653  0.570634     0.011860  0.789949  0.181492    -2.110227  0.281176  0.420504 2019-05-29 23:06:01     42.80     0.55   3250        4556     35.13         31.97       31.94
46  156000  2.143657  0.571088     0.010861  0.788980  0.180146    -2.112471  0.280146  0.421614 2019-05-29 23:53:16     42.78     0.55   3250        4558     35.86         31.85       31.84
47  159250  2.140262  0.571341     0.011610  0.790161  0.181585    -2.106799  0.281337  0.425028 2019-05-30 00:40:39     45.57     0.55   3250        4279     36.64         31.89       31.87
48  162500  2.134807  0.572299     0.011735  0.790928  0.182238    -2.100764  0.282412  0.423584 2019-05-30 01:30:39     42.68     0.55   3250        4568     37.38         31.83       31.80
49  165750  2.135013  0.572501     0.010737  0.791019  0.182865    -2.100967  0.281578  0.423943 2019-05-30 02:18:00     45.70     0.55   3250        4266     38.16         31.95       31.94
```




## 2019-05-25-RTX2080TiX2-transformer_big_single_gpu
running with RTX2080TiX2
speed at training : INFO:tensorflow:loss = 6.1338243, step = 1000 (59.497 sec) 
### final result
BLEU_uncased =  19.87
BLEU_cased =  19.87


```
t2t-trainer \
    --generate_data \
    --problem=translate_enzh_wmt32k \
    --tmp_dir=translate_ai_challenger_2018/tmp \
    --data_dir=translate_ai_challenger_2018/data \
    --output_dir=translate_ai_challenger_2018/model \
    --model=transformer \
    --hparams_set=transformer_big_single_gpu \
    --worker_gpu_memory_fraction=0.9 \
    --worker_gpu=2 \
    --local_eval_frequency=10000 \
    --eval_steps=100000 
```


```
    global_step      loss  accuracy  accuracy_per_sequence  accuracy_top5  approx_bleu_score  neg_log_perplexity  rouge_2_fscore  rouge_L_fscore      train_begin_ts  train_dt  eval_dt  steps  steps/hour  tot_hour
0         10000  3.366171  0.445290               0.003371       0.642333           0.101751           -3.276859        0.190918        0.331073 2019-05-26 02:48:24    129.33     0.63  10000        4639      2.17
1         20000  2.837909  0.494354               0.006117       0.702800           0.126895           -2.770866        0.223382        0.363810 2019-05-26 04:58:22    128.37     0.55  10000        4673      4.31
2         30000  2.545047  0.523336               0.008115       0.737847           0.148082           -2.500454        0.244309        0.387887 2019-05-26 07:07:17    128.38     0.53  10000        4673      6.46
3         40000  2.406234  0.537343               0.009363       0.755134           0.159737           -2.372308        0.256230        0.398011 2019-05-26 09:16:12    128.38     0.53  10000        4673      8.61
4         50000  2.332857  0.547061               0.007615       0.765427           0.162397           -2.298355        0.261475        0.403162 2019-05-26 14:15:22    138.12     0.55  10000        4344     10.92
5         50000  2.332857  0.547061               0.007615       0.765427           0.162397           -2.298355        0.261475        0.403162 2019-05-26 16:34:02      0.12     0.53      0           0     10.93
6         60000  2.276751  0.552056               0.009114       0.772905           0.166898           -2.244387        0.266107        0.408470 2019-05-26 16:48:47    127.25     0.65  10000        4715     13.07
7         60000  2.276751  0.552056               0.009114       0.772905           0.166898           -2.244387        0.266107        0.408470 2019-05-26 18:56:41      0.10     0.63      0           0     13.08
8         70000  2.246140  0.558353               0.011361       0.776174           0.170761           -2.212363        0.269003        0.411458 2019-05-26 22:49:02    129.17     0.63  10000        4645     15.24
9         70000  2.246140  0.558353               0.011361       0.776174           0.170761           -2.212363        0.269003        0.411458 2019-05-27 00:58:50      0.12     0.63      0           0     15.25
10        80000  2.218277  0.560624               0.009863       0.780171           0.172828           -2.183454        0.272371        0.414428 2019-05-27 01:13:48    138.15     0.55  10000        4343     17.56
11        80000  2.218277  0.560624               0.009863       0.780171           0.172828           -2.183454        0.272371        0.414428 2019-05-27 03:32:30      0.12     0.53      0           0     17.58
12        90000  2.196847  0.564761               0.011236       0.783803           0.177006           -2.156684        0.276439        0.418189 2019-05-27 03:47:24    138.22     0.55  10000        4340     19.89
13        90000  2.196846  0.564761               0.011236       0.783803           0.177006           -2.156684        0.276439        0.418189 2019-05-27 06:06:10      0.12     0.63      0           0     19.90
14       100000  2.181761  0.567032               0.010487       0.785004           0.177943           -2.143516        0.280038        0.421584 2019-05-27 06:21:08    126.60     0.65  10000        4739     22.02
15       100000  2.181761  0.567032               0.010487       0.785004           0.177943           -2.143516        0.280038        0.421584 2019-05-27 08:28:23      0.10     0.63      0           0     22.03
```