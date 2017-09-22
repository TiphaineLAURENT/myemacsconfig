# .emacs and .emacs.d

A set of GNU/Emacs config that I use (because Emacs > all)
Probably none of them are made by me, so you can find the link where i found them after their name

## Configuration files

- EPITECH tools - **Add Epitech auto-updated header** - *[Nicolas Sadirac and Frederic Denis based on comment routines by Isaac](https://en.wikipedia.org/wiki/HTTP_404)*
- Web-Mode - **Add emacs compatiblity for editing web code (HTML, PHP, ...)** - *[Francois-Xavier Bois](http://github.com/fxbois/web-mode)*
- Auto-complete - **Add an autocomplete gui** - *[Matsuyama Tomohiro](http://cx4a.org/software/auto-complete)*
- oCAML - **Debug tool based on gdb for CAML** - *[oCAML community](https://github.com/ocaml/ocaml)*

## Getting Started

### Prerequisites

Just make sure that emacs is installed, if not:
```
sudo apt-get install emacs
```

### Installation

To install this directory, first open a terminal, then:

- Clone this repository:
```
git clone git@github.com:TiphaineLAURENT/myemacsconfig.git
```

- Rename emacs configs and move them to your home directory
```
mv ~/myemacsconfig/emacs ~/.emacs
mv ~/myemacsconfig/emacs.d ~/.emacs.d
```

- Move site-lisp to your original one
```
sudo mv -uit ~/myemacsconfig/site-lisp /usr/share/emacs/
```

## Usage

### Basic Emacs

This is how to start emacs in shell mode
```
emacs -nw afile
```

### Contributors

See also the list of [contributors](https://github.com/TiphaineLAURENT/myemacsconfig/contributors) who participated in this project.
