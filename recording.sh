#!/bin/bash

##########################################################
# Download Live Stream V1.0                              #
#                                                        #
# CREATED BY @victorhguillen                             #
#                                                        #
# LAST UPDATE: 04/8/17                                   #
# AUTOMATIC SCRIPT FROM 6:55AM to 9:05AM                 #
# DAYS M T W T F                                         #
# LICENSED GLP - CREATIVE COMMONS                        #
##########################################################

clear
BASEFOLDER=${PWD}"/"

#LOAD ERROR MSG FILE
  . ${BASEFOLDER}"src/errors/.error_msg"

#-- Log File
LOGFILE="${BASEFOLDER}src/logs/record.log"

#LOAD CONFIG FILE
if [ -f $BASEFOLDER"config/.config" ]; then
  . $BASEFOLDER"config/.config"
else
  echo -e "\n$(date)  "$ERROR01 >> $LOGFILE
  exit 0
fi
#-- END IF

## TELEGRAM BOT NOTIFICATIONS ##
## the telegram message bot
## Comment the next line if you don't want to use 
  . $BASEFOLDER"src/telegram/telegram.sh"

  . $BASEFOLDER"src/start_record.sh"

#CHECK IF THE TIME TO STOP IS LESS THAN THE ACTUAL TIME
if [ $TIME_NOW -lt $TIME_TO_STOP ]; then
# START TO RECORD

if type sendMessage &>/dev/null; then
  echo "send message"
   TEXT="Recording ${NAME} ⏰  🎙  Initializing..."
   #SENDING MESSAGE
   sendMessage
else 
  echo -e "$(date)  "$ALERT01 >> $LOGFILE
fi
  
  if [ ! -d "${FOLDER}" ]; then
    mkdir $FOLDER
  fi
  #RUN THE RECORDING
  startRecord

else 
  echo -e "$(date)  "$ALERT02 >> $LOGFILE
fi
## ENDIF

if type sendMessage &>/dev/null; then
  TEXT="Recording ${NAME} ⏰  🎙  <b>Ends...</b> ✅  "
  #SENDING MESSAGE
  sendMessage
fi

exit 0