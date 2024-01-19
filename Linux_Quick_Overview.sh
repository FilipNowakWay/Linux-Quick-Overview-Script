#!/bin/bash

# Script Name: Linux Administration System Overview Script
# Author: Filip Nowak

# Function to display the current date and time
display_date() {
  echo "Date: $(date)"
  echo ""
}

# Function to verify the administrator password
verify_password() {
  read -s -p "Enter the administrator password: " password
  echo ""
  if sudo -k -S echo "" &>/dev/null <<<"$password"; then
    echo "Authentication successful. Running the script..."
    echo ""
  else
    echo "Authentication failed. Exiting the script."
    exit 1
  fi
}

# Function to detect the package manager
detect_package_manager() {
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
}

# Function to display the menu options
display_menu() {
  clear
  echo "Linux Administration System Overview Script"
  echo "------------------------------------------"
  echo "Please select an option:"
  echo "1. System Information"
  echo "2. Disk Usage"
  echo "3. Memory Usage"
  echo "4. Network Information"
  echo "5. User Information"
  echo "6. System Update & Upgrade"
  echo "7. Firewall Configuration"
  echo "8. Log Analysis"
  echo "0. Exit"
  echo ""
}

# Function to execute the selected option
execute_option() {
  local option=$1

  case $option in
    1)
      echo "System Information:"
      echo "-------------------"
      # Task 1: System Information
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
      ;;
    2)
      echo "Disk Usage:"
      echo "-----------"
      # Task 2: Execute the disk usage task
      df -h
      ;;
    3)
      echo "Memory Usage:"
      echo "-------------"
      # Task 3: Execute the memory usage task
      free -h
      ;;
    4)
      echo "Network Information:"
      echo "--------------------"
      # Task 4: Execute the network information task
      ip addr show
      ;;
    5)
      echo "User Information:"
      echo "-----------------"
      # Task 5: Execute the user information task
      getent passwd
      ;;
    6)
      echo "System Update & Upgrade:"
      echo "-----------------------"
      # Task 6: Execute the system update and upgrade tasks
      sudo "$package_manager" update -y
      sudo "$package_manager" upgrade -y
      ;;
    7)
      echo "Firewall Configuration:"
      echo "-----------------------"
      # Task 7: Execute the firewall configuration task
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
      ;;
    8)
      echo "Log Analysis:"
      echo "-------------"
      # Task 8: Execute the log analysis task
      if [ -f "/var/log/messages" ]; then
        sudo tail /var/log/messages
      else
        echo "Log file /var/log/messages not found."
      fi
      ;;
    0)
      echo "Exiting the script..."
      exit 0
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
}

# Main script execution
display_date
verify_password
detect_package_manager

while true; do
  display_menu
  read -p "Enter option: " option
  execute_option "$option"
  read -p "Press enter to continue..."
done

# End of Script
