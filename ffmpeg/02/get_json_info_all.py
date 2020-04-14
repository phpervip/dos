import csv
import os
import os.path
import time
import datetime
import sys
from get_json_info import get_json_data
# def get_video_data(filename):
# 	# 执行probe执行
# 	print(filename)
# 	probe = ffmpeg.probe(filename)
# 	print(probe)

# 导入CSV安装包

fromfile = "mp4_txt_list.txt"
savefile = "mp4_txt_info.csv"

# 1. 创建文件对象
f = open(savefile,'w',encoding='utf-8',newline='')
# 2. 基于文件对象构建 csv写入对象
csv_writer = csv.writer(f)	

# 3. 构建列表头
csv_writer.writerow(["filename","filepath","duration","bit_rate","codec_name","width","height","r_frame_rate","audio_bitrate","duration_hms"])

# 4. 写入csv文件内容
with open(fromfile, 'r', encoding='utf-8') as f:
    count=0
    for line in f.readlines():
        line = line.strip('\n') 
        #print(line)
        video=get_json_data(line)
        #print(video)
        if(video==0):
            duration        = 0
            bit_rate        = 0
            codec_name      = 0
            width           = 0
            height          = 0
            r_frame_rate    = 0
            audio_bitrate   = 0
            duration_hms    = 0
            filename        = 0
        else:    
            duration 		= video[0]
            bit_rate 		= video[1]
            codec_name 		= video[2]
            width 			= video[3]
            height 			= video[4]
            r_frame_rate 	= video[5]
            audio_bitrate 	= video[6]
            duration_seconds = float(duration)
            duration_hms    = datetime.timedelta(seconds=duration_seconds)
        filename = os.path.basename(line)
        print(filename)
        filename = filename[:-8]
        # print(filename)
        # filename = line.split("\")[-1]
        csv_writer.writerow([filename,line,duration,bit_rate,codec_name,width,height,r_frame_rate,audio_bitrate,duration_hms])
        count+=1
        print(count,'done')
print(savefile)    
print(count,'complete!')        



