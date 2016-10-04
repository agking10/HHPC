#!/bin/bash
#author Austin Kemper 10/4/2016
#Validate HHPC documents using w3c api

echo "W3C VALIDTATION REPORT" > ~/CODE/HTML/HHPC/w3cReport.txt
OUTPUTPATH="/Users/austinkemper/CODE/HTML/HHPC/w3cReport.txt"

#HTML
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt
echo "HTML">> ~/CODE/HTML/HHPC/w3cReport.txt
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt

printf "\nindex.html\n">> ~/CODE/HTML/HHPC/w3cReport.txt
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @/Users/austinkemper/CODE/HTML/HHPC/index.html     https://validator.w3.org/nu/?out=gnu >> ~/CODE/HTML/HHPC/w3cReport.txt
printf "\ncalendar.html\n">> ~/CODE/HTML/HHPC/w3cReport.txt
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @/Users/austinkemper/CODE/HTML/HHPC/html/calendar.html     https://validator.w3.org/nu/?out=gnu >> ~/CODE/HTML/HHPC/w3cReport.txt
printf "\ncontact.html\n">> ~/CODE/HTML/HHPC/w3cReport.txt
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @/Users/austinkemper/CODE/HTML/HHPC/html/contact.html     https://validator.w3.org/nu/?out=gnu >> ~/CODE/HTML/HHPC/w3cReport.txt
printf "\nmedia.html\n">> ~/CODE/HTML/HHPC/w3cReport.txt
curl -H "Content-Type: text/html; charset=utf-8"     --data-binary @/Users/austinkemper/CODE/HTML/HHPC/html/media.html     https://validator.w3.org/nu/?out=gnu >> ~/CODE/HTML/HHPC/w3cReport.txt

#CSS
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt
echo "CSS">> ~/CODE/HTML/HHPC/w3cReport.txt
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt

printf "\nthemestyle.css\n" >> ~/CODE/HTML/HHPC/w3cReport.txt
curl -H "Content-Type: text/css; charset=utf-8"     --data-binary @/Users/austinkemper/CODE/HTML/HHPC/style/themestyle.css   https://validator.w3.org/nu/?out=gnu >> ~/CODE/HTML/HHPC/w3cReport.txt


#JS
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt
echo "JS">> $OUTPUTPATH
echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt


echo "-------------------------------------" >> ~/CODE/HTML/HHPC/w3cReport.txt

