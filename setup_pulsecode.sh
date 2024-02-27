#!/bin/bash

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Install Java JDK using Homebrew (if not already installed)
echo "Checking for Java JDK..."
if ! type -p java > /dev/null; then
    echo "Java JDK not found. Installing OpenJDK..."
    brew install openjdk
else
    echo "Java JDK is already installed."
fi

# Configure JAVA_HOME environment variable
echo "Configuring JAVA_HOME..."
echo 'export JAVA_HOME="/usr/local/opt/openjdk"' >> ~/.zshrc
echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Set up Python virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv codepulse-env
source codepulse-env/bin/activate
pip install pylint pandas requests

# Reminder for Node.js installation for VS Code Extension development (assuming Node.js might already be installed)
echo "If you have not installed Node.js, please install it using: brew install node"

echo "Setup completed. Your environment is now ready for PulseCode
 development."
