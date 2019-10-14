# Ice-Lake-DL-Boost
1. Please follow below link to download and install Intel OpenVINO
https://software.intel.com/en-us/openvino-toolkit/choose-download


2. Following below command for converting to INT8 from FP32
OpenVINOProcess_StyleTransfer.cmd <Path to Model file> FP32
Ex: OpenVINOProcess_StyleTransfer.cmd c:\model\a_muse_full-depthwise_5x5-NHWC-nbc8-640x480.pb FP32

3. Below is trouble shooting when you see error message:
   (1) Not find module: Please download and install package via pip install command
   (2) For convert to FP32 from PB file: Please check path is correct or not when you key in command line.
   (3) For convert to INT8 from FP32: Please check path is correct or not for dataset, model, weight and annotation in styletransfer_voc-640x480.yml
   