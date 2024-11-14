#!/bin/bash

function cpu {
  CPU=$(lscpu | awk -F ":" '/^Model name:/ {print $NF}' | xargs) 
}
