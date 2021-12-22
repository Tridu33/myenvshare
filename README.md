[TOC]

# myenv

自定义命令位置，用于windows系统的bat，中文指令自己添加使用即可，本仓库bat文件如果需要请自行下载，有什么好用的bat文件也请告知。

## install

解压到:`D:\arch\myenv`，设置环境变量 `environment variables`：

![setting](.\figures\setting.png)

在`D:\arch\myenv`目录下新建文本文件命名为`打开我的命令路径.bat`，内容是`start explorer "D:\arch\myenv"`,然后任意路径的目录栏输入"打开我的命令路径"(或者先输入cmd再在黑框框输入`打开我的命令路径`命令):

![myenv](.\figures\myenv.gif)

同理，有什么需要做的命令都可以直接写在`D:\arch\myenv`目录，下面是一些可能会有帮助的链接。

把任何程序批处理或者命令粘贴到这里`C:\ProgramData\Microsoft\Windows\Start Menu\Programs`就能固定在windows启动栏，其中比较妙的是：一开始我不知道bat怎么启动Conda命令行，我在这路径找到很多官方软件的快捷链接文件，右键`属性`查看或者`打开文件位置`，可以看到对应命令怎么使用的，复制文本到一个*.bat文件魔改就能实现任意位置启动conda之类的。

如果想添加到右键快捷方式，修改注册表可以参考相关博客。

## bat/ps

CMD 一条命令 执行 多条命令，如果想一次运行多条命令可能用到的连接符个人了解到的有三个：&&，|| 和 &。

- aa && bb
  含义：执行aa，成功后再执行bb
  例子： a.js && node b.js
  如果a.js运行失败则b.js不会再运行

- aa || bb
  含义：先执行aa，若执行成功则不再执行bb，若失败则再执行bb
  例子： a.js || node b.js
  如果a.js运行失败则b.js再运行，如果a.js运行成功则b.js不再运行

- aa & bb
  含义：先执行aa再执行bb，无论aa是否成功
  例子： node a.js & node b.js
  先运行a.js运行，不管运行a.js文件是否报错，b.js接着运行

更多批处理bat命令可以参考手册 https://www.w3cschool.cn/pclrmsc/ PS命令同理找文档或者github项目实例。

```
setx Path "%Path%;D:\arch\myenv" 
```

把以上命令保存成批处理运行或者 cmd 执行，即可实现永久环境变量的注册。

> 类似的，wsl子系统也可以保留这么一个用户自定义命令路径：

```bash
echo 'export PATH=$balabala/bin:$PATH ' >>~/.bash_profile
source ~/.bash_profile
```

windows是cls清屏，unix是clear,完全可以新建这样的命令实现`alias`的功能减少记忆难度，同时nano.exe有windows版本，也可以把unix下的轻应用安装到自己的用户路径中。

# wsl相关

[Scripting With WSL Interoperability: Tips & Tricks | Patrick Wu's Blog](https://patrickwu.space/wslconf/)

cmd输入`wsl`开启子系统，`bash -c "cd ~/; ls;"`多条命令这样执行。

新建一个窗口这样做

```cmd
start wsl -- ls;read -p "Press [Enter] key to start backup..."
```

更多命令看文档。

- dos和unix文件换行符不兼容问题

一次修复所有 shell 脚本的简单方法是：

```sh
find . -type f -name "*.sh" -exec dos2unix {} \;
```

它将递归查找所有扩展名为 .sh 的文件并对其执行 dos2unix，很多编辑器可以自动完成编码格式转换，如notepad++可以选。

## 自动编译或者clion命令辅助编译等

程序编译命令的批处理完全可以做成对应命令，参考`templateScript`相关命令和脚本，其中wsl的python多版本管理，java多版本管理类似(可自行搜索相关文档博客教材之类的)：

```
sudo update-alternatives --install /usr/bin/python python /usr/local/lib/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/local/lib/python3.6 2 
‘优先级’： update-alternatives: using /usr/local/lib/python3.6 to provide /usr/bin/python (python) in auto mode
```

查看

```
update-alternatives --list python
sudo update-alternatives --config python
```

这里讲解windows 怎么连接wsl使用clion编译调试`scons`工程。

跟着[Windows10 使用WSL+CLion搭建C&C++开发环境](https://zhuanlan.zhihu.com/p/74229857)或者[Windows 10 配置Clion+WSL2环境](https://zhuanlan.zhihu.com/p/272522594)搭建clion的wsl环境之后，cmake/makefile相关项目已经很方便了，但是有时候我们会遇到一些scons项目之类的比较旧的项目，这时候如果想调试，需要自定义外部命令交互。

### clion+wsl+scons

## debug

首先搞明白一件事,debug只需要scons在配置g++/clang++编译时开启`-g`编译功能,就能从可执行文件连接到源程序第几行，即vscode也好clion也罢，如果想debug只需要给出可执行文件的位置即可！

![runAndDebug](.\figures\runAndDebug.png)

但是我想修改源代码，clion里面快捷编译然后debug呀，那就看下面：

## 自动调用外部命令compile编译build

接下来，可以用clionBuildSpecificommands目录的vbs辅助文件完成clion链接外部编译命令的操作。

> 比如下面的`SSHlinkWSLAndRunSconsInSpecificDirToBuildapf.vbs`就实现SSH链接wsl然后`scons`编译修改后的源码。

```vbs
Dim WshShell 
Set WshShell=WScript.CreateObject("WScript.Shell") 
WshShell.Run "cmd.exe"
WScript.Sleep 150
WshShell.SendKeys "ssh tridu33@127.0.0.1 -p 2222"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 150
WshShell.SendKeys "12345678"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500 
WshShell.SendKeys "cd /mnt/d/tridu33/apfmakefile"
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1500 
WshShell.SendKeys "scons"
WshShell.SendKeys "{ENTER}"
```

![runAndDebug](.\figures\SconsExtern.jpg)

这样配置的话，每次修改源码后点击锤子，就会启动1的target目标编译任务，进而在wsl工具链执行弹出wsl黑框执行`自定义build目标`，然后scons之后就会生成新可执行文件。

## 也可以根据scon写makefile文件(clion支持)

现在假设你根据上述链接教程开启了wsl的SSH，并且在wsl该项目的路径下`scons`能正常编译项目，最简单的方法是编写 Makefile 文件编译源程序，**Makefile不需要自己写**，scons本质是python批处理 ，直接在命令行输出内容中挑选需要的内容就行。

> 以这个项目为例：https://github.com/aig-upf/automated-programming-framework， 抄其中g++编译命令Makefile文档（参考clionBuildSpecificommands下Makefile）。



















