var cc = false;
var bcc = false;


function addcc(obj)
{
	$("cc").style.display = cc?"none":"block";
	$("addcc").innerHTML = cc?"Ìí¼Ó³­ËÍ":"É¾³ı³­ËÍ";
	cc = cc?false:true;
}

function addbcc(obj)
{
	$("bcc").style.display = bcc?"none":"block";
	$("addbcc").innerHTML = bcc?"Ìí¼ÓÃÜËÍ":"É¾³ıÃÜËÍ";
	bcc = bcc?false:true;
}

function $()
{
	var elements = new Array();
	for ( var i = 0; i < arguments.length; i++)
	{
		var element = arguments[i];
		if (typeof element == 'string')
			element = document.getElementById(element);
		if (arguments.length == 1)
			return element;
		elements.push(element);
	}
	return elements;
}