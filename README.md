# 一个针对类C语言的小型编译器
# A Tiny Compiler for C-Like Language

## 1. 预装软件
首先安装必要的软件：flex, bison, nasm
flex即词法分析器，bison即语法分析器，nasm即汇编编译器
```shell
sudo apt-get install flex
sudo apt-get install bison
```
nasm可以在官网[下载](https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D)安装包，之后将其解压至任意位置，在终端切换到解压目录，并运行以下命令：
```shell
./configure
make
make install
make rdf_install
```

## 2. 编译源文件

在test.c下将该文件改为你自己的源文件，并在项目目录下输入make:
```shell
make
```
即可得到中间代码。中间代码存储在backend文件夹下的my.asm文件。
切换到backend目录再次make,可以得到可执行文件my和汇编源文件my_final.asm。
```shell
cd ./backend
make
```

## 3. 运行目标程序并查看结果

利用gdb可以对可执行文件进行调试。

在backend文件夹下利用gdb调试：
```shell
gdb ./my
```

在gdb下，可以用b 12在第12行建立断点，r运行，c继续运行，info registers查看当前寄存器的值，l 12列出12行附近的代码。

赋值语句执行之后，结果保存在EAX寄存器当中。
