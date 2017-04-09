
# TELEGRAM SEND MESSAGE FUNCTION
sendMessage ()
{

	# TELEGRAM API URL 
	URL="https://api.telegram.org/bot${KEY}/sendMessage"

	# TELEGRAM ARGUMENTS AND MESSAGE INFO
	DATA="chat_id=${CHAT_ID}&disable_web_page_preview=1&parse_mode=${PARSE_MODE}&text=${TEXT}"

	# EXCUTE THE URL VIA CURL
	curl -s \
	--max-time $TIMEOUT \
	-d "$DATA" \
	$URL > /dev/null 2>&1

	if [[ $? -ne 0 ]]; then
		echo -e "$(date)  "$ERROR04  >> $LOGFILE
	fi

}