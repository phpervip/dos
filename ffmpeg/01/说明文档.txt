1.先将mp4_list.bat,get_video_info_all.py,get_video_info.py放在要处理的目录下。
2.执行mp4_list.bat,（windows可双击） 
生成mp4_list.txt
3.执行get_video_info_all.py（windows可双击）
生成mp4_info.csv
命令行下即：python get_video_info_all.py


附：
1. windows下安装python3
官网: https://www.python.org/downloads/release/python-382/ 
(选Version，Windows x86-64 executable installer)
2. 然后python安装ffmpeg-python包
pip install ffmpeg-python