#!/bin/bash

W=$(curl -s https://wttr.in/Bologna?format="%t\n" | head -n 3)
echo "$W"
