window.onload = init;

function init(){
	setUpHHPC();
	setDate();
	startTime();
}

function startTime() {
    var today = new Date();
    var h = today.getUTCHours();
    var m = today.getUTCMinutes();
    var s = today.getUTCSeconds();

    //Check if we need to move a day forward.
    checkResetDay(h, m, s);

    m = checkTime(m);
    s = checkTime(s);
    var timeSlot = document.getElementById("timeSlot");
    timeSlot.innerHTML = h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}

function checkResetDay(h, m, s) {

	if (h === 0 && m === 0 && s === 0) {
		console.log("date change");
		setUpHHPC();
		setDate();
	}
}

function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

