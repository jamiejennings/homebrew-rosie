# To install Rosie Pattern Language on OS X

First, add this repository to brew.  This is a one-time step.

```shell
brew tap jamiejennings/rosie
```

Install the current version of rosie.  (Formulae for other versions may also be
available in this repository.)

```shell
brew install rosie
```

If you want to run the full rosie test suite (not recommended), you can launch
it from brew.


```shell
brew test -verbose rosie
```

# References

* [Rosie Pattern Language project](https://github.com/jamiejennings/rosie-pattern-language)
* [Homebrew](http://brew.sh) package management for Mac OS X
