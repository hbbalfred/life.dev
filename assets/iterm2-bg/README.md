# Random iTerm Background Image

[How to change iTerm background image randomly](https://gist.github.com/shokai/872e375c0b0636b0c2ae)

[iTerm2 interface in AppleScript](https://superuser.com/questions/1068105/iterm2-os-x-change-background-image-for-current-window-from-shell)

- link iterm2-bg-image

```bash
ln -s ./bin/iterm2-bg-image /usr/local/bin/iterm2-bg-image 
```

- call iterm2-bg-image, such as in ~/.zprofile

```bash
iterm2-bg-image $PICTURE_DIR -r > /dev/null 2>&1
```
