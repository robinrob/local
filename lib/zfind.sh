#!/bin/sh

TERM=$1

grep -A 3 $TERM ~/.zshrc
