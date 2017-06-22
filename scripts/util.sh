#!/bin/sh
###############################################################################
# Basic utility functions to use in other scripts 
# Note: This script assumes if you're using linux or osx
###############################################################################

is_mac() { 
    test "$(uname)" = Darwin
}

is_linux() { 
    test "$(uname)" = linux-gnu
}

install_brew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_minikube() {
    if is_linux; then 
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/ 
    elif is_mac  
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.19.1/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
    else 
        echo "Your kernel is not supported"
    fi 
}

install_virtualbox() {
    if is_linux; then
        apt-get update && apt-get install virtualbox
    elif is_mac
        brew cask install virtualbox
    else 
        echo "Your kernel is not supported"
    fi
}