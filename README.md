# ansible_dynamic_inventory
After gaining a basic understanding of how Ansible could work with AWS one of my very first questions was how to use to use the inventory file with AWS' dynamically changing resources.

If I have a group of autoscaled EC2 instances or containers that I want to manage with an ansible server how can I automatically update my inventory file as resources are scaled out or back in?

Searching quickly led me to Ansible's dynamic inventory plugin. When set up correctly the plugin will make an api call the AWS that will return information about the runnning instances. I then used tag based groups to manage the instances that I was interested in managing.

### aws_ec2.yaml
This is my dynamic inventory file. This file is where we call the aws_ec2 plugin as well as provide our aws authentification information. Initially I did use this method to allow the plugin to work correctly, but I was not comfortable leaving sensative information hardcoded into the file. The solution to this issue was to create a role and attach it to my ansible server giving it the required permissions to gather information about running instances.

### ping-playbook.yaml
A simple playbook recreating the ping module. This was done as a simple proof of concept to make sure I was able to access the resources I was wanting to manage.

### web-playbook.yaml
Another simple playbook. Installs apache2, uploads my index.html file, and restarts the service. Again this was done as a simple proof of concept to make sure I was connecting with and updating instances as my resources were scaled in and out by AWS.

### Future Improvements
- [ ] Manage load balancer, target groups, and autoscaling groups with ansible.
- [ ] CI/CD setup
- [ ] Chron jobs/Lambdas/SNS for alerts about scale out/in and automating relating processes
