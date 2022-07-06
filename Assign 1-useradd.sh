#!/bin/bash
echo "Please enter username"
read user
grep -q $user /etc/passwd
if [ $? -eq 0 ]
then
	echo "Error --user ${user} already exists"
	echo "Please enter another user name"
	exit 0
fi
echo "please enter description"
read description
#useradd $user -c $description
echo "Do you need to add userid (y/n)?"
read yn
if [ ${yn} == y ]
then
	echo "please enter ID which is greater than 100"
	read uid
	password=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;`
        echo "randorm generated password is ${password}"
	useradd ${user} -c "${description}" -u ${uid} -p ${password}
	echo
	echo "user ${user} has been created with uid: ${uid} with password:${password}"

elif [ ${yn} == n ]
then
	echo "system will create UID"
	password=`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;`
	useradd ${user} -c "${description}" -p ${password}
	echo "user ${user} has been created with password:${password}"
fi
echo "password for user ${user} is ${password}"
echo "password for user ${user} is ${password}">>/opt/scripts/${user}

