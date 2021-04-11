#!/bin/bash
echo "Hello, welcome to Swap4U App."
sleep 0.5
echo "Preparing directories for installation..."
sleep 0.5
echo "3"
sleep 0.5
echo "2"
sleep 0.5
echo "1"
sleep 0.5

gem install bundler
bundle init
bundle add colorize
bundle add tty-prompt

echo "Opening app"

sleep 0.5
echo "3"
sleep 0.5
echo "2"
sleep 0.5
echo "1"
sleep 0.5
echo "Enjoys !!"
sleep 0.5

ruby ./view/view.rb