# RECORD STREAMING FUNCTION
function startRecord ()
{

	ffmpeg -i $SOURCE_LINK \
	-copyright 1 \
	-c:a libmp3lame \
	-acodec copy \
	-t $TOTAL_TIME \
	$FOLDER$FILE_NAME
 
	if [[ $? -ne 0 ]]; then
		echo -e "$(date)  "$ERROR03  >> $LOGFILE
	fi
}