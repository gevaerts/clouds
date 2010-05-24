#!/bin/sh
git push $HOME/inform/clouds/cloud-clone.git
rsync -e ssh -a --delete -v $HOME/inform/clouds/cloud-clone.git/ gevaerts@shell.evonet.be:WWW/cloud.git/

