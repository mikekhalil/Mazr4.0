#!/bin/bash
###############################################################################
# Basic utility functions to use in other scripts 
# Note: This script assumes if you're not using linux-gnu, you're using OSX
###############################################################################

install_brew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_minikube() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then 
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ 
    else  
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
    fi 
}

install_virtualbox() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        apt-get update && apt-get install virtualbox
    else
        #OSX
        brew cask install virtualbox
    fi
}