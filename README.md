# nbt2yaml docker wrapper

[nbt2yaml](https://bitbucket.org/zzzeek/nbt2yaml) in docker with wrapper script. 

## Usage

* `make install` 
  * default behavior: `make install --prefix=$HOME/.local/`
  * installs the `nbt2yaml.sh` in $HOME/.local/bin as three core tools of
    nbt2yaml
    * `nbt2yaml`
    * `yaml2nbt`
    * `nbtedit`

## Credits

* Wrapper script adapted from [Mike English@Atomic Object](https://spin.atomicobject.com/author/english/) blog post [distributing command line tools with docker](https://spin.atomicobject.com/2015/11/30/command-line-tools-docker/)

