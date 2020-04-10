sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-pip python-dev
sudo apt-get install python3-pip python3-dev
# sudo pip3 install tensorflow-gpu

# A.1 安装python科学套件
# 1. 安装BLAS库（这里安装的是OpenBLAS）,确保在CPU上运行快速的张量运算
sudo apt-get install build-essential cmake git unzip pkg-config libopenblas-dev liblapack-dev

# 2.安装科学套件
sudo apt-get install python-numpy python-scipy python-matplotlib python-yaml

# sudo apt-get install libblas3 liblapack3 liblapack-dev libblas-dev
# sudo apt-get install gfortran

# 3.安装HDF5，用高效的二进制格式保存数值数据的大文件，快速高效保存到磁盘
sudo apt-get install libhdf5-serial-dev python-h5py

# 4.安装Graphviz 和 pydot-ng。将Keras模型可视化
sudo apt-get install graphviz
sudo pip3 install pydot-ng

# 5.opencv
sudo apt-get install python-opencv

# A.2 设置GPU支持 

# GPU info
# lspci -k | grep -A 2 -i "VGA"

# 1. 下载CUDA
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb

# 2.安装CUDA
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda-8-0

# 3.安装cuDNN
# 3.1 下载https://developer.NVIDIA.com/cudnn

# sudo dpkg -i libcudnn6*.deb

# 4.安装TensorFlow
sudo pip3 install tensorflow
sudo pip3 install tensorflow-gpu

# A.3 安装Theano
sudo pip3 install theano

# A.4 安装Keras
sudo pip3 install keras



 