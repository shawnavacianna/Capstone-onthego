
                 
      function showUserDetails() {
        
              var strI=document.getElementById("drivernames").selectedIndex;
              var str =document.getElementsByTagName("option")[strI].value;
             // document.getElementById("btnInit").onclick(localStorage.setItem(key, str));
              if (str == "") {
                  document.getElementById("txtHint").innerHTML = "";
                  return;
              } else { 
                  if (window.XMLHttpRequest) {
                      // code for IE7+, Firefox, Chrome, Opera, Safari
                      xmlhttp = new XMLHttpRequest();
                  } else {
                      // code for IE6, IE5
                      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                  xmlhttp.onreadystatechange = function() {
                  if (this.readyState == 4 && this.status == 200) {
                      document.getElementById("txtHint").innerHTML = this.responseText;
                    }
                  };
                  xmlhttp.open("GET","getuser.php?q="+str,true);
                  xmlhttp.send();
                }
           }