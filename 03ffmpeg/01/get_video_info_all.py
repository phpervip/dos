import ffmpeg
import csv
import os.path
from get_video_info import get_video_data
# def get_video_data(filename):
# 	# 执行probe执行
# 	print(filename)
# 	probe = ffmpeg.probe(filename)
# 	print(probe)

# 导入CSV安装包

# 1. 创建文件对象
f = open('mp4_info.csv','w',encoding='utf-8',newline='')
# 2. 基于文件对象构建 csv写入对象
csv_writer = csv.writer(f)	

# 3. 构建列表头
csv_writer.writerow(["filename","filepath","duration","bit_rate","codec_name","width","height","r_frame_rate","audio_bitrate"])

# 4. 写入csv文件内容

with open("mp4_list.txt", 'r') as f:
    for line in f.readlines():
        line = line.strip('\n') 
        video=get_video_data(line)
        #print(video)
        duration 		= video[0]
        bit_rate 		= video[1]
        codec_name 		= video[2]
        width 			= video[3]
        height 			= video[4]
        r_frame_rate 	= video[5]
        audio_bitrate 	= video[6]
        filename = os.path.basename(line)
        csv_writer.writerow([filename,line,duration,bit_rate,codec_name,width,height,r_frame_rate,audio_bitrate])
        print(line,'写入完成')



