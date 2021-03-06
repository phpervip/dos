import csv
import json
import sys

def is_json(myjson):
		    try:
		        json.loads(myjson)
		    except ValueError:
		        return False
		    return True
def get_json_data(filename):
	# 执行probe执行
	#print(filename)
	with open(filename, 'r') as f:
		#print(filename)
		probe_str = f.read()

		if(is_json(probe_str)):
			probe =json.loads(probe_str)
		else:
			return 0
		if "streams" not in probe:
			return 0
		if "format" not in probe:
			return 0	
	
	video_stream = next((stream for stream in probe['streams'] if stream['codec_type'] == 'video'), None)
	audio_stream = next((stream for stream in probe['streams'] if stream['codec_type'] == 'audio'), None)
	video_format = probe['format']

	if video_stream is None:
		#print('No video stream found', file=sys.stderr)
		#sys.exit(1)
		return 0
	if audio_stream is None:
		#print('No audio stream found', file=sys.stderr)
		#sys.exit(1)	
		return 0

	# 时长
	duration = (video_format['duration'])   
	# 比特率
	bit_rate = (video_format['bit_rate'])
	# 视频编码名称
	codec_name = video_stream['codec_name']
	# 视频实际帧率
	fps = video_stream['r_frame_rate']
	fps_a = fps.split('/');
	r_frame_rate = int(int(fps_a[0])/int(fps_a[1]))

	# 视频宽度
	width = int(video_stream['width'])
	# 视频高度
	height = int(video_stream['height'])
	# 视频帧数
	num_frames = int(video_stream['nb_frames'])
	# 视频宽高比
	# display_aspect_ratio = (video_stream['display_aspect_ratio'])
	# 音频比特率
	audio_bitrate = (audio_stream['bit_rate'])

	# print('width: {}'.format(width))
	# print('height: {}'.format(height))

	# print('duration: {}'.format(duration))
	# print('bit_rate: {}'.format(bit_rate),'kb/s')
	# print('codec_name: {}'.format(codec_name))
	# print('width x height: {}'.format(width),'x','{}'.format(height))
	# print('r_frame_rate: {}'.format(r_frame_rate),'fps')
	# print('audio_bitrate: {}'.format(audio_bitrate),'kb/s')

	# 查看全部信息
	# print(video_stream)
	video_info = []
	video_info.append(format(duration))
	video_info.append(format(bit_rate))
	video_info.append(format(codec_name))
	video_info.append(format(width))
	video_info.append(format(height))
	video_info.append(format(r_frame_rate))
	video_info.append(format(audio_bitrate))
	return video_info


video_info = get_json_data('mp4info/02-037-0285.mp4.txt')
print(video_info)
	