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


function myresize()
{
	var mydiv=document.getElementById("links");
	var num=mydiv.getElementsByTagName("a").length
	var llink=mydiv.getElementsByTagName("a")[num];
	var flink=mydiv.getElementsByTagName("a")[0];
	var totwidth=mydiv.offsetWidth;
	var border_width=1;
	var awidth=Math.floor(totwidth/num)-border_width;
	var rem=totwidth-(num-1)*(awidth+border_width);
	var i=0;
	while (i<num-1)
	{
		mydiv.getElementsByTagName("a")[i].style.width=awidth+"px";
		mydiv.getElementsByTagName("a")[i].style.borderRight=border_width+"px solid silver";
		i++;
	}
	
	rem=totwidth;
	i=0;
	/* these peculiar lines are added because chrome is making the first 6 links wider*/
	while (i<num-1)
	{
		rem-=(mydiv.getElementsByTagName("a")[i].offsetWidth+border_width);
		i++;
	}
	
	mydiv.getElementsByTagName("a")[num-1].style.width=rem+"px";
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
