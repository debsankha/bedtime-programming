Object.prototype.nextObject = function()
	{
		var n = this;
		do n = n.nextSibling;
		while (n && n.nodeType != 1);
		return n;
	}
 
Object.prototype.previousObject = function()
	{
		var p = this;
		do p = p.previousSibling;
		while (p && p.nodeType != 1);
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

	var nextelem;
	nextelem=targ.nextObject();
	if (nextelem.style.display=="none") nextelem.style.display="block";
	else nextelem.style.display=="none";
}
