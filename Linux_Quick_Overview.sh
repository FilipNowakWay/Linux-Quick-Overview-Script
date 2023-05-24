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


        # Task 1: System Information
        echo "System Information:"
        echo "-------------------"
        hostnamectl
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
        cat /etc/passwd
        echo ""

        # Task 6: System Update
        echo "System Update:"
        echo "--------------"
        sudo dnf update -y
        echo ""

        # Task 7: Firewall Configuration
        echo "Firewall Configuration:"
        echo "-----------------------"
        sudo systemctl status firewalld
        echo ""

        # Task 8: Log Analysis
        echo "Log Analysis:"
        echo "-------------"
        sudo tail /var/log/messages
        echo ""

else
  echo "Authentication failed. Exiting the script."
  exit 1
fi

# End of Script