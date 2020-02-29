# twitch_stream
Stream to Twitch via a systemd service and Bash shell script

## Hardware:
- Logitech Webcam C920 USB Web cam, or similar
- Raspberry Pi or Raspberry Pi Zero - https://www.raspberypi.org

## Operating System:
Raspbian Lite - https://downloads.raspberrypi.org/raspbian_lite_latest.torrent
     Flash this to a microSD card that you put in the Raspberry Pi (I used Etcher - https://etcher.io)

## Software:
Uses ffmpeg, h264_omx for encoding, and then streaming video output to a Twitch ingest server with a simple Bash shell script.

- https://www.ffmpeg.org
- https://www.gnu.org/software/bash/

A systemd service will run the script when the Pi is rebooted as well.
https://wiki.debian.org/systemd

## Prerequisites:
Install ffmpeg - sudo apt install ffmpeg

Follow the instructions at the Debian wiki to set up the systemd service.

Use the pi user to run the script.
Put this script in /home/pi/bin/sh - The systemd service is looking for it there.
Make the script exectuable with 
     chmod +x twitch_stream.sh

Uses your Twitch account stream key in the shell script.
Find the line with {stream_key} and put your actual key there in place of {stream_key}
See https://stream.twitch.tv/ingests/ for more information and the server near you.
