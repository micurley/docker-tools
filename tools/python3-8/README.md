how to invoke this tool

## Building
1. Follow this article to generate new keys and upload to github: https://help.github.com/en/enterprise/2.16/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
2. Run:
```
export DOCKER_BUILDKIT=1
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
ssh-add -l

docker build -t <repo>/python3.8-focal:latest -f ./Dockerfile  --ssh default .
```

## Running
`docker run -v (pwd):/repo  -it <repo>/python3-8-focal /bin/fish`
