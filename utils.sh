#checks if the user is root
is_user_root () { 
    if ([ "${EUID:-$(id -u)}" -eq 0 ])
        then
        true;
    else
        then
	false;
    fi
}

#echo error function for if a error apears
echoerr() {
    echo "$@" 1>&2;
}
