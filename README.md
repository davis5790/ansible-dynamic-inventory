ansible_dynamic_inventory
After gaining a basic understanding of how Ansible could work with AWS one of my very first questions was how to use to use the inventory file with AWS' dynamically changing resources.

If I have a group of autoscaled EC2 instances or containers that I want to manage with an ansible server how can I automatically update my inventory file as resources are scaled out or back in?

Searching quickly led me to Ansible's dynamic inventory plugin. When set up correctly the plugin will make an api call the AWS that will return information about the runnning instances. I then used tag based groups to manage the instances that I was interested in managing.

aws_ec2.yaml
This is my dynamic inventory file.