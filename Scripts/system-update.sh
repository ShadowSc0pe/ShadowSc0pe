#!/bin/bash

# System update script for Debian/Ubuntu
# Created by ShadowSc0pe

# Colors
GREEN="\e[32m"
RED="\e[31m"
NEUTRAL="\e[0m"

# Check if the user is root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Error: this script must be run as root.${NEUTRAL}"
  exit 1
fi

echo -e "${GREEN}=== Starting system update... ===${NEUTRAL}"

# Update package list
echo -e "${GREEN}>> Updating package repositories...${NEUTRAL}"
apt update

# Upgrade installed packages
echo -e "${GREEN}>> Installing available updates...${NEUTRAL}"
apt upgrade -y

# Full upgrade (including obsolete packages)
echo -e "${GREEN}>> Performing full system upgrade...${NEUTRAL}"
apt full-upgrade -y

# Remove unnecessary packages
echo -e "${GREEN}>> Cleaning up unused packages...${NEUTRAL}"
apt autoremove -y
apt autoclean

echo -e "${GREEN}=== System update completed successfully! ===${NEUTRAL}"
