#!/bin/bash

set -x

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo ""

echo "........................................"

echo "Installation of Jfrog application"

echo "........................................"

echo "Today's date: `date`"

echo "........................................"

echo ""

# Update system packages

echo "Updating system packages..."

sudo apt update

sudo apt install openjdk-11-jdk -y

# Update system packages

echo "Updating system packages..."

sudo apt update

# Add JFrog Artifactory repository to sources list

echo "Adding JFrog Artifactory repository..."

echo "deb https://releases.jfrog.io/artifactory/artifactory-debs xenial main" | sudo tee -a /etc/apt/sources.list.d/artifactory.list

# Import JFrog GPG key

echo "Importing JFrog GPG key..."

curl -fsSL  https://releases.jfrog.io/artifactory/api/gpg/key/public|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/artifactory.gpg

# Update package list after adding JFrog repository

echo "Updating package list..."

sudo apt update

# Install JFrog Artifactory OSS

echo "Installing JFrog Artifactory OSS..."

sudo apt-get install jfrog-artifactory-oss=7.68.14 -y

# Start and enable the Artifactory service

echo "Starting and enabling Artifactory service..."

sudo systemctl start artifactory.service

sudo systemctl enable artifactory.service

echo "JFrog Artifactory OSS installation completed successfully!"

echo ""

echo "........................................"

echo "Installation of application"

echo "........................................"

echo "Today's date: `date`"

echo "........................................"

echo ""