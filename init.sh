# Install pipx
pip --version > /dev/null 2>&1
pip_exit_code=$?

if [[ "$pip_exit_code" == "0" ]] ; then
    echo 'Pip installed already. Skipping step.'
else
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python3 get-pip.py
    rm get-pip.py
fi

pip install -U pip

# install virtualenv
if pip list | grep "\- virtualenv" > /dev/null 2>&1; then
    echo 'virtualenv installed already. Skipping step.'
else
    pip install virtualenv
fi

# Install virtualenv
if ls | grep "venv" > /dev/null 2>&1; then
    echo 'venv already exists. Skipping step.'
else
    virtualenv -p 3 venv
fi

# Activate virtual environment
source venv/bin/activate

# Install requirements
if [[ -f requirements.txt ]]
   then
    pip install -r requirements.txt
else
    touch requirements.txt
fi

# Update python path
export PYTHONPATH="${PYTHONPATH}:$PWD"
