# running configs
## RTX2080TiX2
```
2019-05-12 19:45:38.178144: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1512] Adding visible gpu devices: 0, 1
2019-05-12 19:45:38.179287: I tensorflow/core/common_runtime/gpu/gpu_device.cc:984] Device interconnect StreamExecutor with strength 1 edge matrix:
2019-05-12 19:45:38.179298: I tensorflow/core/common_runtime/gpu/gpu_device.cc:990]      0 1
2019-05-12 19:45:38.179302: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1003] 0:   N N
2019-05-12 19:45:38.179306: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1003] 1:   N N
2019-05-12 19:45:38.179712: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:0 with 9888 MB memory) -> physical GPU (device: 0, name: GeForce RTX 2080 Ti, pci bus id: 0000:01:00.0, compute capability: 7.5)
2019-05-12 19:45:38.179996: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1115] Created TensorFlow device (/job:localhost/replica:0/task:0/device:GPU:1 with 9890 MB memory) -> physical GPU (device: 1, name: GeForce RTX 2080 Ti, pci bus id: 0000:02:00.0, compute capability: 7.5)
```

## M40X4
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


