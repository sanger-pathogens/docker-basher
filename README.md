# docker-basher
A tool to simplify the creation of docker images with a focus on bio-informatics software/pipelines

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-brightgreen.svg)](https://github.com/sanger-pathogens/docker-basher/blob/master/LICENSE)

# Installation
In your docxker image, download and uncompress the latest version in your /tmp.  
Then create an argument pointing to the ```docker-basher.sh``` script and initialize docker-basher:
```
ARG helper=/tmp/docker-basher/docker-basher.sh
RUN $helper basher_setup
```

Then call the functions provided:
```
# To install apt packages (git and wget in this case)
RUN $helper apt_install_cleanly git wget

```

## License
docker-basher is free software, licensed under [GPLv3](https://github.com/sanger-pathogens/docker-basher/blob/master/LICENSE).

## Feedback/Issues
Please report any issues to the [issues page](https://github.com/sanger-pathogens/docker-basher/issues)


