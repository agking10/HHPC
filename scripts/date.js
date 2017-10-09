window.onload = init;

function init(){
	setUpHHPC();
	setDate();
}

var hhpc;

function createMonth(name,numDays,index){
	var month = {
		name: name,
		numDays: numDays,
		index: index,
		toString: function(){return name + " ("+numDays+"). ";}
	};
	return month;
}
function createDay(name,index){
	var dayToCreate = {
		name: name,
		index: index
	};
	return dayToCreate;
}

function setUpHHPC(){

	var jan = createMonth("January",30,0);
	var feb = createMonth("February",30,1);
	var mar = createMonth("March",31,2);
	var apr = createMonth("April",30,3);
	var may = createMonth("May",30,4);
	var jun = createMonth("June",31,5);
	var jul = createMonth("July",30,6);
	var aug = createMonth("August",30,7);
	var sep = createMonth("September",31,8);
	var oct = createMonth("October",30,9);
	var nov = createMonth("November",30,10);
	var dec = createMonth("December",31,11);
	var xtr = createMonth("Xtra",7,12);

	var monday = createDay("Monday",0);
	var tuesday = createDay("Tuesday",1);
	var wednesday = createDay("Wednesday",2);
	var thursday = createDay("Thursday",3);
	var friday = createDay("Friday",4);
	var saturday = createDay("Saturday",5);
	var sunday = createDay("Sunday",6);

	var months= [jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec, xtr];
	var daysOfTheWeek = [monday, tuesday, wednesday, thursday, friday, saturday, sunday];
	var extraYears = [2015, 2020, 2026, 2032, 2037, 2043]; 

	
	//Set corresponding starts date to go forward from
	var startGregorianYear = 2016;
	var startGregorianMonth = 11;
	var startGregorianDay = 2;

	var startHHPCYear = 2016;
	var startHHPCMonth = 11;
	var startHHPCDay = 1;
	var startHHPCDayOfTheWeekIndex = 4;

	hhpc = {
		months: months,
		daysOfTheWeek: daysOfTheWeek,
		todaysMonth: months[startHHPCMonth], 
		todaysDay: startHHPCDay,
		todaysDayOfTheWeek: daysOfTheWeek[startHHPCDayOfTheWeekIndex],
		todaysYear: startHHPCYear,

		goForward: function(){
			this.todaysDay ++;
			this.todaysDayOfTheWeek = daysOfTheWeek[(this.todaysDayOfTheWeek.index +1) %7];
			if (this.todaysDay > this.todaysMonth.numDays){
				this.todaysDay = 1;
				if (extraYears.indexOf(this.todaysYear) !== -1){
					var newMonthIndex = (this.todaysMonth.index + 1) %13;
				}
				else{
					var newMonthIndex = (this.todaysMonth.index + 1) %12;
				}
				this.todaysMonth = this.months[newMonthIndex];
			}
			if (this.todaysMonth === months[0] && this.todaysDay ===1){
				this.todaysYear ++;
			}

		},
		toString: function(){ return this.todaysDayOfTheWeek.name+ " "+this.todaysMonth.name + " " + this.todaysDay + ", " + this.todaysYear;},
		toStringYearFirst: function() { return this.todaysYear + " " + this.todaysMonth.name + " " + this.todaysDay + " " + this.todaysDayOfTheWeek.name;}
	};

	function getDifferenceBetweenTwoDates(d1, d2){
		var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
		var diffDays = Math.round(Math.abs((d1.getTime() - d2.getTime())/(oneDay)));
		return diffDays;
	}

	//Set number of days to go forward
	var now = new Date(); 
	var dStart = new Date(startGregorianYear,startGregorianMonth,startGregorianDay);
	var dEnd = new Date(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate());
	var numDaysToGoForward = getDifferenceBetweenTwoDates(dStart, dEnd);

	//Go forward
	for (var i = 0 ; i< numDaysToGoForward ; i++){
		hhpc.goForward();
	}
}

function setDate(){
	var dateElement = document.getElementById("dateSlot");
	dateElement.innerHTML = hhpc.toStringYearFirst();
}

