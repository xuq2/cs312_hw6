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
1. Open your router (pfsense), make sure it is ready. 
![image](/imgaes/router.png)
2. Open your controller (One alpine VM); your hosts/nodes (Two alpine VMs).
 ![image](/images/host.png)![image](/images/host2.png)
3. Download ansible package into your controller `apk add ansible`, so that you can run ansible command in hw6auto.sh file.
4. Download my files into your controller by the command `curl https://raw.githubusercontent.com/xuq2/cs312hw6/main/hw6.zip > hw6.zip`.
Unzip it `apk add unzip`, then `unzip hw6.zip`.
Remove the zip file if you want `rm hw6.zip`.
4. Inspect file by `cat hosts.ini` to see if the two hosts ip address are same as your hosts. To check the ip address of your hosts, use `ip addr` or `ifconfig` command. Here my ip address are ***192.168.1.101*** and ***192.168.1.103***.
![image](/images/ip.png) ![image](/images/ip1.png)
 > Don't mess them up!! My controller ip addr is ***192.168.1.102*** You can choose your controller before you curl and install things. Even if you clone one VM, the ip address for each VM should be unique. 

- If they are matched. Congrats! It is so lucky!
- If they aren't, modify the hosts address in two files 'hosts.ini' and 'hw6auto.sh'. If you have more hosts, feel free to add them in these files!
5. Run the script file by command `sh hw6auto.sh`, there will be following output:
![image](/images/output1.png)
Press enter all the way. If you have already have a different ssh under the showing directory, you should enter `y` when they ask to Overwrite.
Then, you will have the following output: 
![image](/images/pass.png)
6. Now, it is time to connect into your two hosts! Entering the password of your hosts is important! You have to have the password to boot your hosts, if your password is empty, it will show permission denied.
![image](/images/pass2.png)
7. You have completed all the operations, wait and see the results!
![image](/images/res1.png)
![image](/images/res2.png)
Got the 
![image](/images/res3.png)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
