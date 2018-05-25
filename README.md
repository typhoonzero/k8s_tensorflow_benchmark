# K8S Tensorflow Benchmark

This repo contains some example scripts to create a Kubernetes distributed
tensorflow benchmark job and get the results.

NOTE: these yamls are generated using a script from https://github.com/PaddlePaddle/Paddle/blob/develop/benchmark/fluid/kube_gen_job.py
, you can update this yaml files if needed.

* To build the docker image, you have to download file `libcudnn.so.7.0.5` first and put it under cloned directory.
See [here](https://developer.nvidia.com/cudnn)
to get the download link, then you can run the following command to build the docker image:
```bash
docker built -t [image:tag] .
```

* To start the job on Kubernetes, run:
```bash
kubectl create -f tf_local.yaml
# or
kubectl create -f tf_dist.yaml
```
