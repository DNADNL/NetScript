if [ "$1" = "-q" -o "$1" = "--quick" ]
	then
		./NS.sh -q 2>&1 | tee LOG_NetScript.txt
	else
		./NS.sh 2>&1 | tee LOG_NetScript.txt
fi
