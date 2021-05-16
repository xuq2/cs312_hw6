# Name: Qi Xu
#### ONDI: xuq2
#### Date: 5/16/2021

#### Files: 
- hosts.ini
- index.html
- webserver.yaml 
- hw6auto.sh
- instruction_manual.md

**My Prerequisite:**
(You will need to observe your ip address. Modify them in files, if these are different from mine.)
1. Controller ip address: <em style="color:red">192.168.1.102</em>
2. Host 1 ip address: <em style="color:red">192.168.1.101</em>
3. Host 2 ip address: <em style="color:red">192.168.1.103</em>

**Instructions**: 
1. 

![image info](/test.png)

////////////////////////////////////////////////////////////////////////////////////////
<h4 style="color:skyblue">More instructions for myself:</h4>

> Getting into the hosts by ssh connection:
- After copy ssh from controller to the hosts, enter `ssh root@192.168.1.XXX` (hosts ip address) to get into the host.
- Enter `ls -al` check if the files matches the hosts
- Enter `cd .ssh/` to get into the ssh-key files
> Quit hosts/nodes
- Enter `exit` to quit from hosts
> Fire up ansible hosts.ini
- Use `ansible hw6nodes(hosts group name) -i(inventory) ./hosts.ini -m(moudles) ping` to use ansible, but need python3 installed. 
**Update command is** : 
`ansible hw6nodes -i ./hosts.ini -b -m raw -a "apk -U add python3"`, first install python, then ping.
-> **-i** : inventory (files name)
-> **-b** : become (become root)
-> **-m raw** : run this raw CLI command
-> **-a** : specify the arguments for the module
**Then ping:**
`ansible hw6nodes -i ./hosts.ini -m ping`