#!/bin/bash
#Josiah McNeeley
#Aden Hilderbrand
#CI201
#21 April 2025

# ----- Colors -----

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# ~~~~~~~~~~~~~~~~~~~~
# Function Definitions


# Disk Management Menu
disk_management_menu() {
    clear
    echo -e "${YELLOW}----- Disk Management Menu -----${NC}"
    PS3="Choose an option (or 5 to return): "
    options=("Display device information" "Display disk partition information" "Display block device information" "Display mounted disk information" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) echo -e "${GREEN}Device Info:${NC}"; lsblk ;;
            2) echo -e "${GREEN}Disk Partition Info:${NC}"; sudo fdisk -l ;;
            3) echo -e "${GREEN}Block Devices:${NC}"; lsblk -d ;;
            4) echo -e "${GREEN}Mounted Disks:${NC}"; df -h ;;
            5) main_menu; break ;;
            *) echo -e "${RED}Invalid option.${NC}" ;;    
        esac
    done
}

# File Management Menu
file_management_menu() {
    clear
    echo -e "${RED}----- File Management Menu -----${NC}"
    PS3="Choose an option (or 7 to return): "
    options=("Present Working Directory" "List Directory Contents" "Create a File" "Change File Permissions" "Remove a File" "Read a File" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) echo -e "Current Directory:\n"; pwd ;;
            2) echo -e "Directory Contents:\n"; ls -l ;;
            3) read -p "Enter file name: " fname; touch "$fname" ;;
            4) read -p "Enter file name: " fname; read -p "Enter permissions (e.g., 755): " perms; chmod "$perms" "$fname" ;;
            5) read -p "Enter file name to delete: " fname; rm -i "$fname" ;;
            6) read -p "Enter file name to read: " fname; cat "$fname" ;;
            7) main_menu; break ;;
            *) echo "Invalid option." ;;
        esac
    done
}

# Network Management Menu
network_management_menu() {
    clear
    echo -e "${GREEN}----- Network Management Menu -----${NC}"
    PS3="Choose an option (or 7 to return): "
    options=("ifconfig" "ping" "traceroute" "nslookup" "View network interfaces" "View routing table" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) ifconfig || ip a ;;
            2) read -p "Enter address to ping: " host; ping -c 4 "$host" ;;
            3) read -p "Enter host for traceroute: " host; traceroute "$host" ;;
            4) read -p "Enter domain for nslookup: " domain; nslookup "$domain" ;;
            5) ip link show ;;
            6) route -n ;;
            7) main_menu; break ;;
            *) echo "Invalid option." ;;
        esac
    done
}

# Placeholder for future menus
process_management_menu() {
    clear
    echo -e "${BLUE}----- Process Management Menu -----${NC}"
    PS3="Choose a process option (or 6 to return): "
    options=("Display running processes" "Search for a process" "Kill a process" "Show top processes" "Display memory usage" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) ps aux ;;
            2) read -p "Enter process name to search: " pname; pgrep -a "$pname" ;;
            3) read -p "Enter PID to kill: " pid; kill "$pid" ;;
            4) top ;;
            5) free -h ;;
            6) main_menu; break ;;
            *) echo "Invalid option." ;;
        esac
    done
}

user_account_management_menu() {
    clear
    echo -e "${CYAN}----- User Account Management Menu -----${NC}"
    PS3="Choose a user option (or 6 to return): "
    options=("Add a user" "Delete a user" "Change user password" "List all users" "Show current user" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) read -p "Enter username to add: " uname; sudo adduser "$uname" ;;
            2) read -p "Enter username to delete: " uname; sudo deluser "$uname" ;;
            3) read -p "Enter username to change password: " uname; sudo passwd "$uname" ;;
            4) cut -d: -f1 /etc/passwd ;;
            5) whoami ;;
            6) main_menu; break ;;
            *) echo "Invalid option." ;;
        esac
    done
}

utilities_menu() {
    clear
    echo -e "${WHITE}----- Utilities Menu -----${NC}"
    PS3="Choose a utility (or 6 to return): "
    options=("System Uptime" "Current Date and Time" "Check Disk Usage" "Check Memory Usage" "Show System Information" "Return to Main Menu")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) uptime ;;
            2) date ;;
            3) df -h ;;
            4) free -h ;;
            5) uname -a ;;
            6) main_menu; break ;;
            *) echo "Invalid option." ;;
        esac
    done
}

# Main Menu
main_menu() {
    clear
    echo -e "${CYAN}========== MAIN MENU ==========${NC}"
    PS3="Select an option (or 7 to exit): "
    options=("Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit Program")
    select opt in "${options[@]}"; do
        case $REPLY in
            1) disk_management_menu ;;
            2) file_management_menu ;;
            3) network_management_menu ;;
            4) process_management_menu ;;
            5) user_account_management_menu ;;
            6) utilities_menu ;;
            7) echo -e "${GREEN}Exiting... Goodbye!${NC}"; exit 0 ;;
            *) echo -e "${RED}Invalid option.${NC}" ;;
        esac
    done
}

# ~~~~~~~~~~~~~~~~
# Script Execution
main_menu

