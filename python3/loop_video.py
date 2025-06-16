#!/usr/bin/pyton3

from moviepy import VideoFileClip, concatenate_videoclips

import os
import argparse

parser = argparse.ArgumentParser(description="This script is used to generate loop of a video")
parser.add_argument('-p', '--path', type=str, required=True, help="The path file will used to generate")
parser.add_argument('-c', '--count', type=int, required=True, help="The loop count to create for the video")
args = parser.parse_args()

# Load the original video
VIDEO_PATH = args.path
CLIP = VideoFileClip(VIDEO_PATH)
LOOP_COUNT = args.count
DIR_PATH = os.path.dirname(os.path.realpath(VIDEO_PATH))
LOOPED_VIDEO = f"{DIR_PATH}/looped_video.mp4"

# Create a list of duplicated clips
LOOPED_CLIPS = [CLIP] * LOOP_COUNT

# Concatenate all the clips into one video
final_clip = concatenate_videoclips(LOOPED_CLIPS)

# Write the result to a file
final_clip.write_videofile(LOOPED_VIDEO, codec="libx264", audio_codec="aac")

