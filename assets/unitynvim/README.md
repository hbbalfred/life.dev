# Neovim Unity on MacOS

> 事先声明，确实有点麻烦 🤯

重点参考：https://github.com/walcht/neovim-unity

关键技术：https://github.com/mhinz/neovim-remote

适用于我的方案 —— Automator

### 自动化程序

使用2段脚本构建app，复制黏贴即可。

- step1.sh - 启动脚本
- step2.scpt - 唤起编辑器

### 已知缺陷：

- 文件路径中不能有空格。
- nvr server 还没启动时，目前用的是警告，而不是直接启动一个 server。
- 在多窗口模式下（如使用tmux）只唤起编辑器，不切换到正确的窗口。
- 在 unity 里打开文件时会有警告：`External Code Editor application path does not exist `，不影响使用。

### 总结

由于对 Automator 不太熟，有很多坑和妥协的地方，不确定能否在其它机器上正常运行。

这里主要说下需要注意的几个地方：

启动脚本的“传递输入”要选择『作为自变量』，而不是"stdin"，否则接收不到参数。

关于『文件路径不能有空格』的问题，主要是因为在Unity的External Tools里设置参数时**要用引号整个包起来**，否则程序会被执行两次。
```
"+$(Line) $(File)"
```
不过呢，执行两次也能得到正确的结果🤔，但因为唤起脚本没仔细处理，所以当没开起 server 的情况下会有两次弹窗提醒，总之就是不正常。

如果实在无法避免文件路径中有空格，可能就要手动解析传入参数了。
