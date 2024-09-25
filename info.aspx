<div id="divInfo" class="infoHelp">
</div>

<script language="javascript">
    function imgInfo_onmouseover(i) {
        
        var obj = document.getElementById("imgInfo"+i);
        var pos = findPos(obj);
        document.getElementById("divInfo").innerHTML = testoInfo[i];
        document.getElementById("divInfo").style.visibility = 'visible';
        document.getElementById("divInfo").style.left = (pos[0] - 215) + "px";
        document.getElementById("divInfo").style.top = (pos[1] + 15) + "px";
    }
    
    function findPos(obj) {
		//alert("find Pos");
		var curleft =findPosX(obj);
		var curtop = findPosY(obj);
		return [curleft,curtop];
		}

	function findPosX(obj)
	  {
	    var curleft = 0;
	    if(obj.offsetParent)
	        while(1) 
	        {
	          curleft += obj.offsetLeft;
	          if(!obj.offsetParent)
	            break;
	          obj = obj.offsetParent;
	        }
	    else if(obj.x)
	        curleft += obj.x;
	    return curleft;
	  }

	function findPosY(obj)
	  {
	    var curtop = 0;
	    if(obj.offsetParent)
	        while(1)
	        {
	          curtop += obj.offsetTop;
	          if(!obj.offsetParent)
	            break;
	          obj = obj.offsetParent;
	        }
	    else if(obj.y)
	        curtop += obj.y;
	    return curtop;
	  }
</script>