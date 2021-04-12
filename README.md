# email-validator

## Syntax
The format of an email address is local-part@domain, where the local part may be up to 64 octets long and the domain may have a maximum of 255 octets.[4] The formal definitions are in RFC 5322 (sections 3.2.3 and 3.4.1) and RFC 5321—with a more readable form given in the informational RFC 3696[b] and the associated errata.

## Local-part of email address
uppercase and lowercase Latin letters A to Z and a to z
digits 0 to 9
printable characters !#$%&'*+-/=?^_`{|}~
dot ., provided that it is not the first or last character and provided also that it does not appear consecutively (e.g., John..Doe@example.com is not allowed).

## Execute the validator

Open the Terminal application on **Linux or Unix**. Navigate to the folder that you downloaded the two files and run the following command.

```
$ ./emailvalidator.sh emailaddress.txt
```
OR

Open command prompt on **Windows**

```
bash ./emailvalidator.sh emailaddress.txt
```
