Some useful custom docker files.

# clion-remote-build
A docker file to use with clion for remote build.

* Username: developer
* Password: developer

```sh
# Build
docker build -t clion-remote-build clion-remote-build/ 

# Run
docker run --rm -d -p 1403:22 clion-remote-build

# Connect with ssh
ssh developer@localhost -p 1403

# Copy public ssh key
ssh-copy-id developer@<server> -p1403
```

