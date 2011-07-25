Object.prototype.nextObject = function() {
	var n = this;
	n=n.parentNode;
	do n = n.nextSibling;
	while (n.tagName!="DIV");
	return n;
}
 
Object.prototype.previousObject = function() {
	var p = this;
	do p = p.previousSibling;
	while (p.tagName!="DIV");
	return p;
}



function whichElement(e)
{
	var targ;
	if (!e)
	{
		var e=window.event;
	}
	if (e.target)
	{
		targ=e.target;
	}
	else if (e.srcElement)
	{
		targ=e.srcElement;
	}
	if (targ.nodeType==3) // defeat Safari bug
	{
		targ = targ.parentNode;
	}

	var tname;
	var newtext;
	tname=targ.nextObject();
	targ.innerHTML.replace("expand","hide");
	if (tname.style.display=="block")
	{
		tname.style.display="none";
		newtext=targ.innerHTML.replace("hide","expand");
		targ.innerHTML=newtext;
	}
	
	else 
	{

		tname.style.display="block";
		newtext=targ.innerHTML.replace("expand","hide");
		targ.innerHTML=newtext;
	}
}
	
/*function whichElement2(e)
{
	var targ;
	if (!e)
	{
		var e=window.event;
	}
	if (e.target)
	{
		targ=e.target;
	}
	else if (e.srcElement)
	{
		targ=e.srcElement;
	}
	if (targ.nodeType==3) // defeat Safari bug
	{
		targ = targ.parentNode;
	}

	var tname;
	tname=targ.nextObject();
	tname.style.display="block";
}

*/
