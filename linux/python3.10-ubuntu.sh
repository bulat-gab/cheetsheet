sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
# Press ENTER to confirm adding repository.

sudo apt install python3.10 python3.10-venv python3.10-dev -y

#Make symbolic link
ls -la /usr/bin/python3
sudo rm /usr/bin/python3
sudo ln -s python3.10 /usr/bin/python3

# Install PIP for Python 3.10
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

echo "python3 version: $(python3 --version)"
echo "python3.10 version: $(python3.10 --version)"
echo "pip version: $(python3 -m pip --version)"
