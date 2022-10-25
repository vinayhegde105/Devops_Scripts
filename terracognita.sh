#!/bin/bash

# url: https://github.com/cycloidio/terracognita.git
#Sample Command: terracognita aws --hcl ec2 --tfstate terraform.tfstate --aws-default-region us-east-1 -i aws_instance
#Sample Command: terracognita google --project cycloid-sandbox --region us-central1 --credentials /home/mathieu/cycloid/google/cycloid-iam-9789b361a19b.json --tfstate resources.tfstate --hcl resources.tf -i google_compute_instance -i google_compute_network


#Command to install terracognita
curl -L https://github.com/cycloidio/terracognita/releases/latest/download/terracognita-linux-amd64.tar.gz -o terracognita-linux-amd64.tar.gz
tar -xf terracognita-linux-amd64.tar.gz
chmod u+x terracognita-linux-amd64
sudo mv terracognita-linux-amd64 /usr/local/bin/terracognita
terracognita --help
