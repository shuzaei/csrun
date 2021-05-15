if [ $# -ne 1 ]
then
    echo "Usage: csrun filename"
    exit 1
else
    echo -e "csrun: \e[34mcompile\e[0m $1.cs"
    message=`mcs "$1.cs" -out:"$1" 2>&1`
    result=$?

    if [ $result -ne 0 ]
    then
        echo ""
        IFS=$'\n'
        for line in $message
        do
            echo "csrun: mcs: $line"
        done
        echo ""
        echo -e "csrun: \e[31mcompile failed\e[0m"
    else
        echo -e "csrun: \e[32mcompile success\e[0m"
        echo -e "csrun: \e[34mrun\e[0m $1"
        "./$1"
    fi
fi