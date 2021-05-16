if [ $# -ne 1 ]
then
    printf "Usage: csrun filename\n"
    exit 1
else
    printf "csdb: \033[34mcompile\033[0m $1.cs\n"
    message=`mcs "$1.cs" -out:"$1" 2>&1`
    result=$?

    if [ $result -ne 0 ]
    then
        printf "\n"
        IFS=$'\n'
        for line in $message
        do
            printf "csdb: mcs: $line\n"
        done
        printf "\n"
        printf "csdb: \033[31mcompile failed\033[0m\n"
    else
        printf "csdb: \033[32mcompile success\033[0m\n"
        printf "csdb: \033[34mrun\033[0m $1\n"
        mono $1
    fi
fi
