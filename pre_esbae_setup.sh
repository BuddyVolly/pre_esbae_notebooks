#!/bin/bash

while getopts p: flag
do
    case "${flag}" in
        p) project=${OPTARG};;
    esac
done

folder_name="~/venv/pre_esbae"
mkdir -p $folder_name # Create your folder (included partents if are given).
python3 -m venv $folder_name # Create the venv, this line could take some time.
source $folder_name/bin/activate # Activate the virtual enviroment just created.
pip install ipykernel # Install ipykernel in our venv.
python -m ipykernel install --user --name="pre_esbae" --display-name="pre_esbae" 

pip install "git+https://github.com/openforis/earthengine-api.git@v0.1.343#egg=earthengine-api&subdirectory=python"
pip install "git+https://github.com/BuddyVolly/eSBAE"

deactivate # (optional) exit from environment.

cd $project
wget "https://raw.githubusercontent.com/BuddyVolly/pre_esbae_notebooks/main/time_series_testing.ipynb"