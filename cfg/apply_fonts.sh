#!/bin/sh

###
### This script generate font settings
###

mkfontscale
mkfontdir

xset fp rehash
fc-cache

xset q
