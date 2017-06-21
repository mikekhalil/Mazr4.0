################################################################################
# This script will serve as a basic install script to get dependencies and build 
# a local development environment. Currently, only linux will be supported, but 
# will work towards supporting OS X as well. Will need a way to install goland
# minikube, and python. 
#
# Note: this is not intended to be useed yet
#
#
################################################################################

set -o errexit
set -o pipefail

echo "setup dev environment..."

source "utils.sh"

# Install homebrew for mac users if you don't already have it
# Currently requires some intervention from users (clicking enter)
if [[ "$OSTYPE" == "linux-gnu" ]]; then 
    which -s brew 
    if [[ $? != 0 ]]; then 
        install_brew
    fi 
fi 

# minikube => local kubernetes development, so we can each have access to our
#own "cluster" without requiring additional hardware / cloud resources 
install_virtualbox
install_minikube


