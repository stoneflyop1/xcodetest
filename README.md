xcodetest
=========

learn objective-c by examples...
ignore .DSStore 
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
add  .DS_Store to .ignore file as a line

