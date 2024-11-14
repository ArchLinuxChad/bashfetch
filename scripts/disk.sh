#!/bin/bash

function disk {
  DISKUSED=$(df -h | awk '/\/$/ {print $3}')
  DISKTOTAL=$(df -h | awk '/\/$/ {print $2}')
}
