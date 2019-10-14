REM This program is convert to FP32 and INT8 for OpenVINO Style transfer

REM set environment
call "C:\Program Files (x86)\IntelSWTools\openvino\bin\setupvars.bat"

REM convert to FP32 and copy xml file and bin file for INT8 calibration

cd "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\model_optimizer"
python mo_tf.py --input_model %1 --data_type %2

copy "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\model_optimizer\*.xml" "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\tools\calibration_tool\" /y
copy "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\model_optimizer\*.bin" "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\tools\calibration_tool\" /y

REM convert to INT8
cd "C:\Program Files (x86)\IntelSWTools\openvino\deployment_tools\tools\calibration_tool"
set /p ymlfilename=What's YML File name?
echo %ymlfilename%
python calibrate.py -c %ymlfilename%

copy *_i8.bin "%userprofile%\Documents\Intel\OpenVINO\inference_engine_samples_build\intel64\Release\" /y
copy *_i8.xml "%userprofile%\Documents\Intel\OpenVINO\inference_engine_samples_build\intel64\Release\" /y

cd "%userprofile%\Documents\Intel\OpenVINO\inference_engine_samples_build\intel64\Release\"

echo Please follow up below command line
echo "style_transfer_sample -i <<Content picture full path>> -m <<Model XML file full path>> -pc -d <<Inference device>> -ni <<Inference iteration>> "


rem set /p exefile=What's program do you perform?
rem set /p content=What's picture do you input?
rem set /p model=What's Model do you want to use?
rem set /p Device=What's device do you want to use for inferncing?
rem set /p NI=How much iteration?

rem %exefile% -i %content% -m %model% -pc -d %Device% -ni %NI%


