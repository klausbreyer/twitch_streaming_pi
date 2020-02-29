# twitch_stream
Stream to Twitch via a systemd service and Bash shell script

I am assuming some familiarity with the Raspberry Pi, Debian Linux, and the using the Bash shell.

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
https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6

## Prerequisites:
Install ffmpeg from command line

 $ sudo apt install ffmpeg

Put the twitch_stream.service file in /etc/systemd/system/

Uses the pi user to run the script. Put the twitch_stream.sh script in /home/pi/bin/sh - The systemd service is looking for it there.
Make the script exectuable with 
    $ chmod +x twitch_stream.sh

Uses your Twitch account stream key in the shell script.
Edit the script with a text editor like nano or vim. Find the line with {stream_key} and put your actual key there in place of {stream_key} then save the file.
See https://stream.twitch.tv/ingests/ for more information and the server near you.

Once the service file and shell script are in the right location, you can start the service

$ sudo systemctl start twitch_stream

Make the service start on a reboot or loss of power to the Pi. 

$ systemctl enable twitch_stream
