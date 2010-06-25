#!/bin/sh
git push $HOME/inform/clouds/cloud-clone.git
rsync -e ssh -a --delete -v $HOME/inform/clouds/cloud-clone.git/ gevaerts@shell.evonet.be:WWW/cloud.git/
rsync -e ssh -a --delete -v "$HOME/inform/clouds/cloud Materials/Release/" gevaerts@shell.evonet.be:WWW/cloud-web/
#scp Source/story.ni gevaerts@shell.evonet.be:WWW/cloud.txt
