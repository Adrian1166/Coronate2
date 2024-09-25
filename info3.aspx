<div id="divInfo3" class="infoHelp3">
</div>

<script language="javascript">
    function imgInfo_onmouseover3(i,j) {
        
        var obj = document.getElementById("imgInfo"+i);
        var pos = findPos3(obj);
        //document.getElementById("divInfo").innerHTML = testoInfo[i];
        document.getElementById("divInfo3").style.visibility = 'visible';
        document.getElementById("divInfo3").style.left = (pos[0] - j) + "px";
        document.getElementById("divInfo3").style.top = (pos[1] + 15) + "px";
    }

    function findPos3(obj) {
		//alert("find Pos");
		var curleft =findPosX3(obj);
		var curtop = findPosY3(obj);
		return [curleft,curtop];
		}

	function findPosX3(obj)
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

	function findPosY3(obj)
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