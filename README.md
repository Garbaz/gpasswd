**THERE IS NO GUARANTEE THAT THESE SCRIPTS ARE SECURE!**

# posixpassmgr

A set of shell scripts to manage passwords using POSIX shell commands and gpg for maximum portability. The resulting file is in a readable plain-text format and therefore only requires gpg (or more specifically some form of OpenPGP / AES) to decrypt.

*Why not use a password manager like keepass?*

Because to use a password manager, I need the password manager (Or at least some special software to decrypt the password file) whenever I want to access the passwords. This might not be given on every system.

## Scripts:

### posixpassmgr.sh
*TODO*

**Synopsis**

```bash
test="Hello World"
posixpassmgr.sh COMMAND [ARGS]
```
**Description**

This script is intended to become an interface for the other scripts like git for git-commit, git-push, et cetera.


### conf.sh

**Description**
This file will be sourced by all other scripts.
It contains definitions of variables like the file location (`File`) or the delimiter (`Delim`) between fields in the file.


### getpasswd.sh

**Synopsis**
```bash
getpasswd.sh SEARCH_REGEX
```
**Description**

Decrypts the `File`, searches for the given string using `grep -i` (-i: Ignore case) and DISPLAYS THE RESULTS IN PLAIN TEXT (!).

**Todo**

- Allow for password / username only output for piping
- Allow for "`clear` after X seconds"


### addpasswd.sh

**Synopsis**

```bash
addpasswd.sh [TITLE] [NAME] [PASSWORD]
```

**Description**

Interactively asks for any parameters not given (e.g. `Pass:`), decrypts the `File`, appends the given combination of Title, Name and Password and encrypts it again.
The values will be appended in the following form:
```bash
"$title $Delim $name $Delim $pass"
#Default:
"$title | $name | $pass"
```
The `Delim`iter is defined in conf.sh.


### rmpasswd.sh
*TODO*

**Synopsis**

```bash
rmpasswd.sh SEARCH_REGEX
```

**Description**

Decrypts the `File`, searches for the given string using `grep -i` (-i: Ignore case), interactively asks which entries should be deleted and encrypts the changed `File` again. The interactive prompt will only display the title of each entry.

**Todo**

- Allow for forcing non-interactive


### clippasswd.sh
*TODO*

**Synopsis**
```bash
clippasswd.sh SEARCH_REGEX
```

**Description**

Decrypts the `File`, searches for the given string using `grep -i` (-i: Ignore case) and copies the password of the resulting entry to the X-server's clipboard using `xclip` (Not POSIX compliant).
If multiple matching entries are found it will interactively ask which entry should be copied. The interactive prompt will only display the title of each entry.

**Todo**

- Allow for copying of username
- Allow for forcing non-interactive

## TODO:

- Add `--help` options
