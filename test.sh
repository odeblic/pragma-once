#!/bin/sh

ln    ifdef.h ifdef_hl.h
ln -s ifdef.h ifdef_sl.h

ln    once.h  once_hl.h
ln -s once.h  once_sl.h

gcc -E main.c

