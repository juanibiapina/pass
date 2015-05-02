# pass

Pass is a simple password manager that works on the terminal.

# WARNING

Since this is still early development, the store format will probably change in the future.

# Dependencies

- gnupg
- tree
- pwgen
- [lasher](https://github.com/basherpm/lasher)

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

2. Generate a key pair for this device

  ~~~sh
  $ pass gen-key
  ~~~

  This will create a public key file on the current directory.

3. Add the public key to the store

  ~~~sh
  $ pass add-device <hostname_key.gpg>
  ~~~

  Where \<hostname_key.gpg\> is the public key generated on the previous step.

4. Add a password:

  ~~~sh
  $ pass add site.com
  ~~~

5. Retrieve a password:

  ~~~sh
  $ pass read site.com
  ~~~
