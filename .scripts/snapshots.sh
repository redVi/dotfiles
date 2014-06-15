#!/bin/bash
### Get Jekyll Snapshot ###

cd ~/Downloads/
rm ~/Downloads/{jekyll.tar.gz,juvia.tar.gz}
echo "remove old snapshots"
rhc save-snapshot jekyll
rhc save-snapshot juvia
exit 0
