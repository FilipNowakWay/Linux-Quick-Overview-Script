#!/bin/bash

# Script Name: Linux Administration System Overview Script
# Author: Filip Nowak
echo "Date: "
date

# Description: This script demonstrates various Linux administration tasks.

read -s -p "Enter the administrator password: " password
echo ""

# Verify Administrator Password
if sudo -k -S echo "" &>/dev/null <<<"$password"; then
  echo "Authentication successful. Running the script..."
  echo ""

  # Detect Package Manager
  if command -v apt >/dev/null 2>&1; then
    package_manager="apt"
  elif command -v dnf >/dev/null 2>&1; then
    package_manager="dnf"
  elif command -v zypper >/dev/null 2>&1; then
    package_manager="zypper"
  elif command -v yum >/dev/null 2>&1; then
    package_manager="yum"
  else
    echo "Package manager not found. Exiting the script."
    exit 1
  fi

  # Task 1: System Information
  echo "System Information:"
  echo "-------------------"
  if command -v hostnamectl >/dev/null 2>&1; then
    hostnamectl
  elif command -v uname >/dev/null 2>&1; then
    uname -a
  elif command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a
  else
    echo "Unable to retrieve system information."
  fi
  echo ""

  # Task 2: Disk Usage
  echo "Disk Usage:"
  echo "-----------"
  df -h
  echo ""

  # Task 3: Memory Usage
  echo "Memory Usage:"
  echo "-------------"
  free -h
  echo ""

  # Task 4: Network Information
  echo "Network Information:"
  echo "--------------------"
  ip addr show
  echo ""

  # Task 5: User Information
  echo "User Information:"
  echo "-----------------"
  getent passwd
  echo ""

  # Task 6: System Update
  echo "System Update:"
  echo "--------------"
  sudo "$package_manager" update -y
  echo ""

  # Task 7: Firewall Configuration
  echo "Firewall Configuration:"
  echo "-----------------------"
  if command -v systemctl >/dev/null 2>&1; then
    if systemctl is-active --quiet firewalld; then
      systemctl status firewalld
    elif systemctl is-active --quiet ufw; then
      systemctl status ufw
    elif systemctl is-active --quiet iptables; then
      systemctl status iptables
    else
      echo "Firewall service not found or not active."
    fi
  else
    echo "Systemctl command not found. Unable to check firewall status."
  fi
  echo ""

  # Task 8: Log Analysis
  echo "Log Analysis:"
  echo "-------------"
  if [ -f "/var/log/messages" ]; then
    sudo tail /var/log/messages
  else
    echo "Log file /var/log/messages not found."
  fi
  echo ""

else
  echo "Authentication failed. Exiting the script."
  exit 1
fi

# End of Script
