# Linux-Quick-Overview-Script

Linux Quick Overview Script 🐧

This repository contains a Linux administration script that provides a quick overview of various aspects of a Linux system. 📚

## Features:

✅ Displays system information.

✅ Shows disk usage details.

✅ Provides memory usage statistics.

✅ Presents network information.

✅ Lists user information.

✅ Performs system updates.

✅ Configures the firewall.

✅ Analyzes system logs.

## Usage:

1. Clone the repository:
```
git clone https://github.com/your-username/linux-quick-overview-script.git
```

2. Change into the cloned directory:
```
cd linux-quick-overview-script
```

3. Run the script:
```
./Linux_Quick_Overview.sh
```

4. Enter the administrator password when prompted to proceed with the script.

*Sit back and let the script provide a comprehensive overview of your Linux system!*

## Common Error Fix:

If you encounter the following error when running the script:

Linux_Quick_Overview.sh: line 2: $'\r': command not found
Linux_Quick_Overview.sh: line 5: $'\r': command not found
Linux_Quick_Overview.sh: line 7: syntax error near unexpected token $'{\r'' 'inux_Quick_Overview.sh: line 7: display_date() {

It may be due to Windows-style line endings in the script. To fix this issue, you can convert the line endings to Unix/Linux format. You can use the `dos2unix` command to do this:

1. Install `dos2unix` if needed (skip if it's already installed):
```bash
sudo dnf install dos2unix  # For Fedora
```
   
Convert the line endings:

```bash
dos2unix Linux_Quick_Overview.sh
```

After running these commands, the script should have the correct Unix/Linux-style line endings, and you should be able to execute it without encountering the mentioned errors.


## Compatibility:
This script is designed for cross-distribution compatibility and works on various Linux distributions. It detects the package manager used by the system (apt, dnf, zypper, yum) and adjusts the commands accordingly. The script requires the appropriate package manager and firewall service (firewalld, ufw, iptables) to be installed and properly configured on your system.

## Contributions:
Contributions are welcome! If you have suggestions for improvements or encounter any issues, please open an issue or submit a pull request.

### Please note that this script has been updated to support a wider range of Linux distributions and includes improved error handling and messages.
