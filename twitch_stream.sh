#!/bin/sh

# Source the variable to config the stream kmey.
source /home/pi/twitch_streaming_pi/key.config

# Sets the input source, video settings, output settings, send to Twitch ingest server
# Higher resolution (i.e., for a Logitech 920 Webcam)

ffmpeg -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f v4l2 -thread_queue_size 10240 -codec:v h264 -s 1920x1080 -i /dev/video0 -codec:v copy -codec:a copy -f flv  rtmp://ber.contribute.live-video.net/app/ ${STREAM_KEY}
