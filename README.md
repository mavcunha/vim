### Vim Configurations

Just a convenient way to keep my `vim` configurations available. You can
get ideas from it if you want to. I encourage you to fork or create
one repository to yourself it doesn't make much sense pull request
it.

Below is how I setup my configurations in different systems, read the
[manual on initialization of
Vim](http://vimdoc.sourceforge.net/htmldoc/starting.html#initialization)
for more information. 

### Setup on UNIX systems

Download the repository on your home folder (`/home/[username]`) under
the name of `.vim`, then create a symbolic link to the *rc* files.

    $ ln -s .vim/vimrc ~/.vimrc
    $ ln -s .vim/gvimrc ~/.gvimrc

### Setup on OS X systems

Same as above, the only difference is your home folder on OS X lives
at `/Users/[username]`.

### Setup on Windows systems

You should be able to create a [NTFS symbolic
link](http://en.wikipedia.org/wiki/NTFS_symbolic_link) to your home
folder. 

### Note to self: Adding new modules...

    git submodule add http://github.com/author/module.git bundle/module
    git add .
    git commit 
