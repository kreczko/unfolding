#!/bin/bash
# This script is meant to be called by the "script" step defined in

set -e

python --version
python -c "import numpy; print('numpy %s' % numpy.__version__)"

# Check if ROOT and PyROOT work
root -l -q
python -c "import ROOT; ROOT.TBrowser()"

# Check that rootpy can be imported
time python -c 'import rootpy'
# What if ROOT has already been initialized?
time python -c 'from ROOT import kTRUE; import rootpy'

time nosetests

