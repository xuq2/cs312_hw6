# generate ssh keys
echo Generating ssh keys...
ssh-keygen -t rsa -b 1024

host1="192.168.1.101"
host2="192.168.1.103"
#copy ssh keys to hosts/nodes
echo Copying ssh keys to hosts to...
echo $host1
echo $host2
ssh-copy-id -i /root/.ssh/id_rsa root@$host1
ssh-copy-id -i /root/.ssh/id_rsa root@$host2

#running playbook
echo Running playbook...
ansible-playbook webserver.yaml -i hosts.ini

#Curl websites
curl $host1
echo "sleep 3 seconds"
sleep 3
curl $host2

