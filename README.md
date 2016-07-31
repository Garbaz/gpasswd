**THERE IS NO GUARANTEE THAT THESE SCRIPTS ARE SECURE!**

# gpasswd

A set of shell scripts to manage passwords using POSIX shell commands and gpg for maximum portablilty. The resulting file is in a readable plaintext format and therefore only requires gpg (or more specifically some form of OpenPGP / AES) to decrypt.

*Why not use a password manager like keepass?*

Because to use a password manager, I need the password manager (Or at least some special software to decrypt the password file) whenever I want to access the passwords. This might not be given on every system.

## Scripts:

### conf.sh
This file will be sourced by all other scripts.
It contains definitions of variables like the file location (`File`) or the delimiter (`Delim`) between fields in the file.

### gpasswd.sh
*TODO*

**Synopsis**
```sh
gpasswd.sh COMMAND [ARGS]
```
**Description**
This script is intended to become an interface for the other scripts like git for git-commit, git-push, et cetera.

### getpasswd.sh

**Synopsis**
```sh
getpasswd.sh SEARCH_REGEX
```
**Description**
Decrypts the `File`, searches for the given string using `grep -i` (-i: Ignore case) and DISPLAYS THE RESULTS IN PLAIN TEXT (!).

**Todo**
- Allow for password / username only output for piping
- Allow for "`clear` after X seconds"

### addpasswd.sh

**Synopsis**
```sh
addpasswd.sh [TITLE] [NAME] [PASSWORD]
```

**Description**
Interactively askes for any parameters not given (e.g. `Pass:`), decrypts the `File`, appends the given combination of Title, Name and Password and encrypts it again.
The values will be appended in the following form:
```sh
"$title $Delim $name $Delim $pass"
#Default:
"$title | $name | $pass"
```
The `Delim`iter is defined in conf.sh.

### rmpasswd.sh
*TODO*

**Synopsis**
```sh
rmpasswd.sh SEARCH_REGEX
```

**Description**
Decrypts the `File`, searches for the given string using `grep -i` (-i: Ignore case), interactively askes which entries should be deleted and ecrypts the chaged `File` again. The interactive prompt will only display the title of each entry.

### clippasswd.sh

**Synopsis**
```sh
clippasswd.sh SEARCH_REGEX
```

**Description**
