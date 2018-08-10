//Dây là hàm lTrim(): bo dau trang dau chuoi
function lTrim(sString)
{
while (sString.substring(0,1) == ' ')
{
sString = sString.substring(1, sString.length);
}
return sString;
}

//Hàm ti?p theo là rTrim() b? nh?ng kho?ng tr?ng ? d?ng cu?i chu?i.
function rTrim(sString)
{
while (sString.substring(sString.length-1, sString.length) == ' ')
{
sString = sString.substring(0,sString.length-1);
}
return sString;
}

//Hàm Trim() là t? h?p c?a hai hàm lTrim() rTrim():

function Trim(sString)
{
while (sString.substring(0,1) == ' ')
{
sString = sString.substring(1, sString.length);
}
while (sString.substring(sString.length-1, sString.length) == ' ')
{
sString = sString.substring(0,sString.length-1);
}
return sString;
}
/**********************************************************************/ 
/*Function name :isDigit(theDigit) */ 
/*Usage of this function :test for an digit */ 
/*Input parameter required:thedata=string for test whether is digit */ 
/*Return value :if is digit,return true */ 
/* else return false */ 
/**********************************************************************/ 
function isDigit(theDigit) 
{ 
var digitArray = new Array('0','1','2','3','4','5','6','7','8','9'),j; 

for (j = 0; j < digitArray.length; j++) 
{if (theDigit == digitArray[j]) 
return true 
} 
return false
} 
/*************************************************************************/ 
/*Function name :isPositiveInteger(theString) */ 
/*Usage of this function :test for an +ve integer */ 
/*Input parameter required:thedata=string for test whether is +ve integer*/ 
/*Return value :if is +ve integer,return true */ 
/* else return false */ 
/*function require :isDigit */ 
/*************************************************************************/ 
function isPositiveInteger(theString) 
{ 
var theData = new String(theString) 

if (!isDigit(theData.charAt(0))) 
if (!(theData.charAt(0)== '+')) 
return false 

for (var i = 1; i < theData.length; i++) 
if (!isDigit(theData.charAt(i))) 
return false 
return true 
} 
/**********************************************************************/ 
/*Function name :isDate(s,f) */ 
/*Usage of this function :To check s is a valid format */ 
/*Input parameter required:s=input string */ 
/* f=input string format */ 
/* =1,in mm/dd/yyyy format */ 
/* else in dd/mm/yyyy */ 
/*Return value :if is a valid date return 1 */ 
/* else return 0 */ 
/*Function required :isPositiveInteger() */ 
/**********************************************************************/ 
function isDate(s,f) 
{var a1=s.split("/"); 
var a2=s.split("-"); 
var e=true; 
if ((a1.length!=3) && (a2.length!=3)) 
{ 
e=false; 
} 
else 
{if (a1.length==3) 
var na=a1; 
if (a2.length==3) 
var na=a2; 
if (isPositiveInteger(na[0]) && isPositiveInteger(na[1]) && isPositiveInteger(na[2])) 
{ if (f==1) 
{var d=na[1],m=na[0]; 
} 
else 
{var d=na[0],m=na[1]; 
} 
var y=na[2]; 
if (((e) && (y<1000)||y.length>4)) 
e=false 
if (e) 
{ 
v=new Date(m+"/"+d+"/"+y); 
if (v.getMonth()!=m-1) 
e=false; 
} 
} 
else 
{ 
e=false; 
} 
} 
return e 
} 
function contentChar(str)
{
	var i;
	for (var i = 0; i < str.length; i++)  
	{		
		if (str.charAt(i) == ":") 
		return true 
	} 
	return false
}
/**********************************************************************/ 
/*Function name :isDateTime(s) */ 
/*Usage of this function :To check s is a valid format */ 
/*Input parameter required:s=input string */ 
/* f=input string format  in dd/mm/yyyy */ 
/*Return value :if is a valid date return 1 */ 
/* else return 0 */ 
/*Function required :isPositiveInteger() */ 
/**********************************************************************/ 
function isDateTime(s) 
{	
	var array = (s+" ").split(' ');
	var date, time, h, i;
	date= array[0];
	time= array[1];	
	if (isDate(date,0))
	{			
		if (!contentChar(Trim(time)))
			return false;
		var array1 = time.split(':');
		if (isPositiveInteger(array1[0]) && isPositiveInteger(array1[1]))
		{				
			h= parseInt(array1[0]);
			i= parseInt(array1[1]);
			
			if ((h<=24) && (i<=60))						
				return true;			
			else										
				return false;
		}
		else			
			return false;
	}	
	return false;	
}
function converToDate(str)
{
	var array = (str).split(' ');
	return (array[0]);
}
function CompareDates(str1,str2)
{  
   var array = (str1).split("/");
   var array1 = (str2).split("/");   
   var dt1   = parseInt(array[0]);
   var mon1  = parseInt(array[1]);
   var yr1   = parseInt(array[2]);
   var dt2   = parseInt(array1[0]);
   var mon2  = parseInt(array1[1]);
   var yr2   = parseInt(array1[2]);
   var date1 = new Date(yr1, mon1, dt1);
   var date2 = new Date(yr2, mon2, dt2);

   if(date1 < date2)
   {      
      return -1;
   }
  if(date1 > date2)
   {      
      return 1;
   }
   return 0;
} 

function checkDate(v) 
{ 
var s=v.a.value; 
if (isDate(s,0)) //dd/mm/yyyy format 
return true; 
else 
alert("The inputted date value is not valid!"); 
return false; 
} 
function isPositiveFloat(theString) 
	{ 
		var theData = new String(theString) 
		var count = 0
		if (!isDigit(theData.charAt(0))) 
		if (!(theData.charAt(0)== '+')) 
		return false 
		
		for (var i = 1; i < theData.length; i++) 
			{
				if (!isDigit(theData.charAt(i)) && !(theData.charAt(i)== '.'))
				return false 
				if (theData.charAt(i)==".") count = count +1		
			}
		if (count >1) return false 
		return true 
} 