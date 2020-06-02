#!/bin/bash

ANSIBLE_USER=ansible
ANSIBLE_PASSWORD_HASH='$1$yrOR09NZ$i1JVWVJ5Bgbcm0ighjLv7z0'
WHEEL_GROUP=wheel

# Add ansible user
sudo useradd -m $ANSIBLE_USER

# Add ansible user to wheel group and set password
sudo usermod -aG $WHEEL_GROUP -p $ANSIBLE_PASSWORD_HASH $ANSIBLE_USER

# Make .ssh dir and keys
sudo su -c "mkdir ~/.ssh" - $ANSIBLE_USER
sudo su -c "echo \"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPGP1cQaT1x6y9suI/kjsdhfkljashdflkjashdfewrmz3giYPSUYw33g7Oj13j+334U76Qkc04veyafUWjcYbqeM5H8WuxFQKKRKSesZsoFXZqOa6N6I7FkskgiuYQk6R2oqaJyGiQAyzTwxBv5LcxrT0cKp9wpZXaaTrrWngZuGFEsoOUEIBxrhR+7GJrjCApcLYsVUDAUgJLO9ojbfZr2xjzu4OUtCP+N7DP7Ux6aotKJWKhqk7VEO6SOl5VLjUTUDrxU6rQR8ZlJIMrsuPPtU1w/Hbvfq1AnXJYvp2Y6qRAxybDlH4yOUr2dcyaG1ZlJSNaygGc+jBHykG36Df ansible@jump01\" > ~/.ssh/authorized_keys" - $ANSIBLE_USER
sudo su -c "chmod 700 ~/.ssh" - $ANSIBLE_USER
sudo su -c "chmod 400 ~/.ssh/authorized_keys" - $ANSIBLE_USER

exit 0
