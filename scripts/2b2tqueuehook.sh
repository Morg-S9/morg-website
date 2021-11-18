while :
do
	# check 2b2t.io api for the last normal and priority queue check, remove time code, set both as variables
	# set "date" command output as a variable
	twobq=`curl -s "https://2b2t.io/api/queue?last=true" | jq '.[0][1]'`
	twobpq=`curl -s "https://2b2t.io/api/prioqueue?last=true" | jq '.[0][1]'`
	datetime=`date`

	# set messages inside variables
	export greet="As of $datetime"
	export twobqm="There are $twobq people in normal queue"
	export twobpqm="There are $twobpq people in priority queue"

	# send statuses of both queues to a discord webhook with messages:
	# "There are $2bq people in the normal queue"
	# "There are $2bpq people in the priority queue"
	curl --header "Content-Type: application/json" \
                --request POST \
                --data "{\"content\": \"$greet\"}"  \
                $twobqwebhook

	curl --header "Content-Type: application/json" \
		--request POST \
		--data "{\"content\": \"$twobqm\"}"  \
		$twobqwebhook

	curl --header "Content-Type: application/json" \
                --request POST \
                --data "{\"content\": \"$twobpqm\"}"  \
                $twobqwebhook

	# sleep for 10 minutes
	sleep 600

done
