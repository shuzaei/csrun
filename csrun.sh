if [ $# -ne 1 ]
then
    printf "Usage: csrun <file>\n"
    exit 1
else
    printf "csrun: \033[34mcompile\033[0m $1.cs\n"
    message=`mcs "$1.cs" -out:"$1" 2>&1`
    result=$?

    if [ $result -ne 0 ]
    then
        printf "\n"
        IFS=$'\n'
        for line in $message
        do
            printf "csrun: mcs: $line\n"
        done
        printf "\n"
        printf "csrun: \033[31mcompile failed\033[0m\n"
    else
        printf "csrun: \033[32mcompile success\033[0m\n"
        printf "csrun: \033[34mrun\033[0m $1\n"
        mono $1
    fi
fi
