# twitch_stream
Stream to Twitch via a systemd service and Bash shell script.

I am assuming some familiarity with the Raspberry Pi, Debian Linux, and the using the Bash shell.

## Hardware:
- Logitech Webcam C920 USB Web cam, or similar - https://www.amazon.com/Logitech-Widescreen-Calling-Recording-Desktop/dp/B006JH8T3S
- Tripod for the Web cam - https://www.amazon.com/Lightweight-Webcam-Tripod-Logitech-Camera/dp/B076SHC6RN
- Raspberry Pi Zero W - https://www.raspberypi.org (I got mine from Adafruit) - https://www.adafruit.com/product/3400
- Pimoroni case for the Pi - https://www.adafruit.com/product/3471
- Power supply for the Raspberry Pi - https://www.adafruit.com/product/1995
- A Sandisk 16GB microSD card - https://www.amazon.com/SanDisk-COMINU024966-16GB-microSD-Card/dp/B004KSMXVM

## Operating System:
- Raspbian Lite - https://downloads.raspberrypi.org/raspbian_lite_latest.torrent
     - Flash this to a microSD card that you put in the Raspberry Pi (I use Etcher - https://etcher.io)
     - Eject the microSD card, then put it back in. You will need to add files to the root of the /boot filesystem.

- There are two files you need to run the Raspberry Pi headless - that is, without a keyboard, mouse, or monitor.
     - ssh file - This is an empty file used to enable SSH on boot. Put it in the root of the microSD card on the /boot filesystem
     - wpa_supplicant.conf - I uploaded an example file - wpa_supplicant.conf.example - to this repo. Be sure to edit it to use your WiFi network name, WiFi network password, and verify your country code. Once the file is edited, rename it to wpa_supplicant.conf and put in the root of your microSD card on the /boot filesystem.

- Once the two files are on the microSD card, eject it, put in the Pi, and plug the Pi in. 

- You can then log in remotely via SSH to the shell. Use a client like PuTTY for Windows, a terminal for Linux, or the Terminal app for MacOS

## Software:
Uses ffmpeg, h264_omx for encoding, and then streaming video output to a Twitch ingest server with a simple Bash shell script.
- https://www.ffmpeg.org
- https://www.gnu.org/software/bash/

A systemd service will run the script when the Pi is rebooted as well.
- https://wiki.debian.org/systemd
- https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6

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
