Object.prototype.nextObject = function() {
	var n = this.parentNode;
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


function resize()
{
	var mydiv=document.getElementById("links");
	var flink=document.getElementById("flink");
	var llink=document.getElementById("llink");
//	alert(mydiv.innerHTML);
	var totwidth;
	totwidth=parseFloat(mydiv.style.width);
	alert(mydiv.style.scrollWidth);

	var rem;
	rem=totwidth-6*parseFloat(flink.width);
	llink.width=rem.toString();
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
	
	if (targ.className!='null') return 0;

	var tname;
	var oldtext;
	var newtext;
	tname=targ.nextObject();
	targ.innerHTML.replace("expand","hide");
	if (tname.style.display=="block")
	{
		tname.style.display="none";
		oldtext=targ.innerHTML;
		newtext=oldtext.replace("hide","expand");
		targ.innerHTML=newtext;
	}
	
	else 
	{

		tname.style.display="block";
		oldtext=targ.innerHTML;
		newtext=oldtext.replace("expand","hide");
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
