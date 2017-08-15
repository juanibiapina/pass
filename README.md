# pass

Pass is a simple password manager that works on the terminal.

# Dependencies

- gnupg
- tree
- pwgen

# Installation


### Using [brew](http://brew.sh/)

~~~sh
$ brew tap juanibiapina/pass
$ brew install juanibiapina/pass/pass
~~~

### Using [basher](https://github.com/basherpm/basher)

Make sure you get `tree` and `pwgen` from whatever package manager your platform provides. `gnupg` should already be available. Then run:

~~~sh
$ basher install juanibiapina/pass
~~~

# Local usage

1. Initialize the store:

  ~~~sh
  $ pass init
  ~~~

  This will ask you for a passphrase using gnupg. You usually neet to set
  `GPG_TTY=${tty}` for it to work properly.

4. Add a password:

  ~~~sh
  $ pass add site.com
  ~~~

5. Retrieve a password:

  ~~~sh
  $ pass read site.com
  ~~~
