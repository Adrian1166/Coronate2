<div id="divInfo2" class="infoHelp2">
</div>

<script language="javascript">
    function imgInfo_onmouseover2(i,j) {
        
        var obj = document.getElementById("imgInfo"+i);
        var pos = findPos2(obj);
        document.getElementById("divInfo2").innerHTML = testoInfo[i];
        document.getElementById("divInfo2").style.visibility = 'visible';
        document.getElementById("divInfo2").style.left = (pos[0] - j) + "px";
        document.getElementById("divInfo2").style.top = (pos[1] + 15) + "px";
    }
    
    function findPos2(obj) {
		//alert("find Pos");
		var curleft =findPosX2(obj);
		var curtop = findPosY2(obj);
		return [curleft,curtop];
		}

	function findPosX2(obj)
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

	function findPosY2(obj)
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