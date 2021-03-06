# .emacs, .emacs.d and site-lisp

A set of GNU/Emacs config that I use (because Emacs > all)
Probably none of them are made by me, so you can find the link where i found them after their name

## Configuration files

- EPITECH tools - **Add Epitech auto-updated header** - *[Nicolas SADIRAC and Frederic DENIS based on comment routines by Isaac](https://en.wikipedia.org/wiki/HTTP_404)*
- Web-Mode - **Emacs compatiblity for editing web languages(HTML, PHP, ...)** - *[Francois-Xavier BOIS](http://github.com/fxbois/web-mode)*
- Auto-complete - **Auto-completion gui** - *[Matsuyama TOMOHIRO](http://cx4a.org/software/auto-complete)*
- oCAML - **Debug tool based on gdb for CAML** - *[oCAML community](https://github.com/ocaml/ocaml)*
- Auto-source - **Classes source file creation tool** - *[Tiphaine LAURENT](https://github.com/TiphaineLAURENT/myemacsconfig)*
- Fill-Column-Indicator - **Draw a column for programming syntaxe** - *[Alpaker](https://github.com/alpaker/Fill-Column-Indicator)*
- Lua-mode - **Emacs compatibily for editing Lua** - *[Tons of Contributors](http://immerrr.github.com/lua-mode)*
- Electric-case - **Auto-case based on snake_case(C) and camelCase(Java, Scala, AHK)** - *[zk_phi](http://hins11.yu-yake.com/)*
- And some other configs

## Getting Started

### Prerequisites

Just make sure that emacs is installed, if not:
```
sudo apt-get install emacs
```

### Installation

To install this directory, first open a terminal, then:

- Clone this repository and enter it:
```
git clone git@github.com:TiphaineLAURENT/myemacsconfig.git
cd myemacsconfig
```

#### Manually

- Rename emacs configs and move them to your home directory
```
mv ~/myemacsconfig/emacs.d ~/.emacs.d
```

- Move site-lisp to your original one
```
sudo mv -uit ~/myemacsconfig/site-lisp /usr/share/emacs/
```

#### Automatically

- Use the install script provided:
```
./install.sh
```

## Usage

### Basic Emacs

This is how to start emacs in shell mode
```
emacs -nw afile
```

### Contributors

See also the list of [contributors](https://github.com/TiphaineLAURENT/myemacsconfig/contributors) who participated in this project.
