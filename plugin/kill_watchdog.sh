#!/bin/bash
ps -ef | grep watchdog.sh | grep -v grep | grep bash | awk '{print $2}' | xargs kill
