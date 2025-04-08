#!/bin/bash
# Aden Hilderbrand
# Josiah McNeely
# CI201 
# Section 01PC
# 
# series of menus and sub-menus to execute a number of linux sysadmin cli functions

######### functions ########

#functions directly from mainmenu
disk_menu () {
	echo "disk_menu " 
    select menu in "Display Device Info" "Display Disk Partition Info" "Display Block Device Info" "Display Mounted Disk Info" "Main Menu"; do
        case $menu in
            "Display Device Info") device_info ;;
            "Display Disk Partition Info")  part_info ;;
            "Display Block Device Info")  block_info ;;
            "Display Mounted Disk Info")  mount_info ;;
            "Main Menu") 
                echo Returning to main menu ... 
                main_menu
                ;;
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
file_menu () {
	echo "file_menu "	
    select menu in "Present Working Directory" "List Directory Contents" "Create File" "Change File Permissions" "Remove File" "Read File" "Main Menu"; do
        case $menu in
            "Present Working Directory") present_working_dir ;;
            "List Directory Contents") list_dir_contents ;;
            "Create File") create_file ;;
            "Change File Permissions") change_file_perm ;; 
            "Remove File") remove_file ;; 
            "Read File") read_file ;; 
            "Main Menu") 
                echo Returning to main menu ...
                main_menu
                ;; 
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
network_menu () {
	echo "network_menu "	
    select menu in "ifconfig" "ping" "traceroute" "nslookup" "View Network Interfaces" "View Network Routing Table" "Current System Users" "Client Machine Info" "Main Menu"; do
        case $menu in
            "ifconfig") ip_info ;;
            "ping") ping_info ;;
            "traceroute") trace_route ;;
            "nslookup") nslookup_func ;; 
            "View Network Interfaces") netwk_interfaces_info ;; 
            "View Network Routing Table") netwk_routing_table ;;
            "Current System Users") current_sys_users ;; 
            "Client Machine Info") client_machine_info ;; 
            "Main Menu") 
                echo Returning to main menu ...
                main_menu
                ;; 
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
process_menu () {
	echo "process_menu "	
    select menu in "Display Processes" "Display Processes by Usage" "Terminate a Process" "Display Disk Usage" "Display Free Disk Space" "Display System Uptime" "Main Menu"; do
        case $menu in
            "Display Processes") display_processes ;;
            "Display Processes by Usage") display_top ;;
            "Terminate a Process") kill_process ;;
            "Display Disk Usage") display_disk_use ;; 
            "Display Free Disk Space") display_free_disk ;; 
            "Display System Uptime") display_uptime ;; 
            "Main Menu") 
                echo Returning to main menu ...
                main_menu
                ;; 
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
user_menu () {
	echo "user_menu "	
    select menu in "Add user" "Delete user" "Lock user password" "Get user information" "Add group" "Delete group" "Find user" "Find group" "Main Menu"; do
        case $menu in
            "Add user") add_user ;;
            "Delete user") delete_user ;;
            "Lock user password") lock_user_pass ;;
            "Get user information") get_user_info ;; 
            "Add group") add_group ;; 
            "Delete group") delete_group ;; 
            "Find user") find_user ;; 
            "Find group") find_group ;; 
            "Main Menu") 
                echo Returning to main menu ...
                main_menu
                ;; 
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
util_menu () {
	echo "util_menu "	
    select menu in "Date/Time" "Calendar" "View Manual (man) Pages" "Determine File Type" "Determine Command Type" "Sort File" "Search File" "Main Menu"; do
        case $menu in
            "Date/Time") date_time ;;
            "Calendar") calendar ;;
            "View Manual (man) Pages") man_pages ;;
            "Determine File Type") find_file_type ;;
            "Determine Command Type") find_command_type ;; 
            "Sort File") sort_file ;; 
            "Search File") search_file ;; 
            "Main Menu") 
                echo Returning to main menu ...
                main_menu
                ;; 
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}

#### disk management functions ####
device_info () {
	echo "device_info "	
    echo "WIP"
}
part_info () {
	echo "part_info "	
    echo "WIP"
}
block_info () {
	echo "block_info "	
    echo "WIP"
}
mount_info () {
	echo "mount_info"
    echo "WIP"
}

#### file management functions ####
present_working_dir () {
	echo "present_working_dir"
    echo -e "You are here: $PWD\n"
}
list_dir_contents () {
	echo "list_dir_contents"
    echo -e "Contents of current directory: \n"
    ls -l
    echo -e "\n"
}
create_file () {
	echo "create_file"
    read -p "Name your new file: " file
    touch ${file}
}
change_file_perm () {
	echo "change_file_perm"
    echo "WIP"
}
remove_file () {
	echo "remove_file"
    read -p "Name file to be removed: " file 
    rm ${file}
}
read_file () {
	echo "read_file"
    read -p "Name file to be displayed: " file
    more ${file}
}

#### Network management functions ####
ip_info () {
	echo "ip_info"
    ip a
}
ping_info () {
	echo "ping_info"
    echo -e "What IP address would you like to ping?\nxxx.xxx.xxx.xxx"
    read IP
    ping -i 1 -c 3 ${IP}
    echo -e "\n" 
}
trace_route () {
	echo "trace_route"
    echo -e "What IP address would you like to trace?\nxxx.xxx.xxx.xxx"
    read IP
    traceroute ${IP}
    echo -e "\n" 
}
nslookup_func () {
    echo "nslookup_func"
    echo "WIP"
    # research this
}
netwk_interfaces_info () {
    echo "netwk_interfaces_info"
    echo "WIP"
    # find a way to differentiate ip info and this function
}
netwk_routing_table () {
    echo "netwk_routing_table"
    echo "WIP"
}
current_sys_users () {
    echo "current_sys_users"
    w 
}
client_machine_info () {
    echo "client_machine_info"
    # research how this would be executed
}

#### process management ####
display_processes () {
    echo "display_processes"
}
display_top () {
    echo "display_top"
    top
}
kill_process () {
    echo "kill_process"
    # what process would you like to kill
    #
    # kill ${pid} or ${name}
}
display_disk_use () {
    echo "display_disk_use"
}
display_free_disk () {
    echo "display_free_disk"
}
display_uptime () {
    echo "display_uptime"
    uptime
}

#### user account management ####
# not very hard to implement, just lots of requesting variables from user
add_user () {
    echo "add_user"
    echo "WIP"
}
delete_user () {
    echo "delete_user"
    echo "WIP"
}
lock_user_pass () {
    echo "lock_user_pass"
    echo "WIP"
}
get_user_info () {
    echo "get_user_info"
    echo "WIP"
}
add_group () {
    echo "add_group"
    echo "WIP"
}
delete_group () {
    echo "delete_group"
    echo "WIP"
}
find_user () {
    echo "find_user"
    echo "WIP"
}
find_group () {
    echo "find_group"
    echo "WIP"
}

#### utilities ####
date_time () {
    echo "date_time"
}
calendar () {
    echo "calendar"
}
man_pages () {
    echo "man_pages"
    read -p "What command do you want to learn more about?: " cmd
    man ${cmd}
}
find_file_type () {
    echo "find_file_type"
    # find typing of existing file, or more info about a given file type? research 
}
find_command_type () {
    echo "find_command_type"
    # no clue
}
sort_file () {
    echo "sort_file"
}
search_file () {
    echo "search_file"
    # searching for something within a file. likely cat | grep ${string}
}

#mainmenu
main_menu () {
	echo "mainmenu. what are you managing"	
    select menu in "Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit"; do
        case $menu in
            "Disk Management") disk_menu ;;
            "File Management") file_menu ;;
            "Network Management") network_menu ;;
            "Process Management") process_menu ;;
            "User Account Management") user_menu ;;
            "Utilities") util_menu ;;
            "Exit") 
                echo thanks for using
                exit 0
                ;;
            *) echo "Invalid Option, Try Again" ;;
        esac
    done
}
#functions end

#### global , what runs first ####
clear
main_menu
