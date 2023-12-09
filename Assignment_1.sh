#!/bin/bash
# this is a comment
echo -n "Enter your directory: "
read -r x
du -sh "$x"
