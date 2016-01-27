#!/bin/bash

WATCH_FOLDER=/watch
DATA_FOLDER=/data

inotifywait -m -r -q -e moved_to -e create --format '%f' "$WATCH_FOLDER" | while read FILE
do
	filebot -script fn:amc --output "$DATA_FOLDER" --def clean=n --def "movieFormat=Movies/{n.upperInitial().space('.')}.{y}.{vf}.{vc}.{ac}.{group}" --def music=y --def subtitles=fr -non-strict "$WATCH_FOLDER"
done
