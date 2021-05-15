if [ $# -ne 1 ]
then
    echo "Usage: csdb filename"
    exit 1
else
    echo -e "csdb: \e[34mcompile\e[0m $1.cs"
    message=`mcs -debug "$1.cs" -out:"$1" 2>&1`
    result=$?

    if [ $result -ne 0 ]
    then
        echo ""
        IFS=$'\n'
        for line in $message
        do
            echo "csdb: mcs: $line"
        done
        echo ""
        echo -e "csdb: \e[31mcompile failed\e[0m"
    else
        echo -e "csdb: \e[32mcompile success\e[0m"
        echo -e "csdb: \e[34mdebug\e[0m $1"
        mono --debug $1
    fi
fi