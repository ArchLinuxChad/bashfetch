#!/bin/bash

function mem {
  MEMUSED=$(free -h | awk '/^Mem:/ {print $3}')
  MEMTOTAL=$(free -h | awk '/^Mem:/ {print $2}')
}
