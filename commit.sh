#!/bin/bash

/usr/bin/rake generate && git add . && git commit -am "$1" && git push origin source && /usr/bin/rake deploy
