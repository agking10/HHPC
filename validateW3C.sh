#!/bin/bash
#author Austin Kemper 10/4/2016
#Validate HHPC documents using w3c api

OUTPUT_PATH="/Users/austinkemper/CODE/HTML/HHPC/w3cReport.txt"
HHPC_ROOT_PATH="/Users/austinkemper/CODE/HTML/HHPC"
CSS_LINES_TO_HEAD=20
echo "W3C VALIDTATION REPORT" > $OUTPUT_PATH

#HTML
echo "-------------------------------------" >> $OUTPUT_PATH
echo "HTML">> $OUTPUT_PATH
echo "-------------------------------------" >> $OUTPUT_PATH

printf "\nindex.html\n">> $OUTPUT_PATH
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @$HHPC_ROOT_PATH/index.html     https://validator.w3.org/nu/?out=gnu >> $OUTPUT_PATH
sleep 1

printf "\ncalendar.html\n">> $OUTPUT_PATH
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @$HHPC_ROOT_PATH/html/calendar.html     https://validator.w3.org/nu/?out=gnu >> $OUTPUT_PATH
sleep 1

printf "\ncontact.html\n">> $OUTPUT_PATH
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @$HHPC_ROOT_PATH/html/contact.html     https://validator.w3.org/nu/?out=gnu >> $OUTPUT_PATH
sleep 1

printf "\nmedia.html\n">> $OUTPUT_PATH
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @$HHPC_ROOT_PATH/html/media.html     https://validator.w3.org/nu/?out=gnu >> $OUTPUT_PATH
sleep 1

#CSS
echo "-------------------------------------" >> $OUTPUT_PATH
echo "CSS">> $OUTPUT_PATH
echo "-------------------------------------" >> $OUTPUT_PATH

printf "\nthemestyle.css\n" >> $OUTPUT_PATH
curl -F "file=@$HHPC_ROOT_PATH/style/themestyle.css;type=text/css" -F output=text/plain -F warning=0 http://jigsaw.w3.org/css-validator/validator | head -$CSS_LINES_TO_HEAD >> $OUTPUT_PATH
echo "^^^^^^^^^ TEXT CUT OFF ^^^^^^^^" >> $OUTPUT_PATH
sleep 1

printf "\nindex.css\n" >> $OUTPUT_PATH
curl -F "file=@$HHPC_ROOT_PATH/style/index.css;type=text/css" -F output=text/plain -F warning=0 http://jigsaw.w3.org/css-validator/validator | head -$CSS_LINES_TO_HEAD >> $OUTPUT_PATH
echo "^^^^^^^^^ TEXT CUT OFF ^^^^^^^^" >> $OUTPUT_PATH
sleep 1

printf "\ncalendar.css\n" >> $OUTPUT_PATH
curl -F "file=@$HHPC_ROOT_PATH/style/calendar.css;type=text/css" -F output=text/plain -F warning=0 http://jigsaw.w3.org/css-validator/validator | head -$CSS_LINES_TO_HEAD >> $OUTPUT_PATH
echo "^^^^^^^^^ TEXT CUT OFF ^^^^^^^^" >> $OUTPUT_PATH
sleep 1

printf "\ncontact.css\n" >> $OUTPUT_PATH
curl -F "file=@$HHPC_ROOT_PATH/style/contact.css;type=text/css" -F output=text/plain -F warning=0 http://jigsaw.w3.org/css-validator/validator | head -$CSS_LINES_TO_HEAD >> $OUTPUT_PATH
echo "^^^^^^^^^ TEXT CUT OFF ^^^^^^^^" >> $OUTPUT_PATH
sleep 1

printf "\nmedia.css\n" >> $OUTPUT_PATH
curl -F "file=@$HHPC_ROOT_PATH/style/media.css;type=text/css" -F output=text/plain -F warning=0 http://jigsaw.w3.org/css-validator/validator | head -$CSS_LINES_TO_HEAD >> $OUTPUT_PATH
echo "^^^^^^^^^ TEXT CUT OFF ^^^^^^^^" >> $OUTPUT_PATH
sleep 1

#JS
echo "-------------------------------------" >> $OUTPUT_PATH
echo "JS">> $OUTPUT_PATH
echo "-------------------------------------" >> $OUTPUT_PATH


echo "-------------------------------------" >> $OUTPUT_PATH

