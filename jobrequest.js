jQuery(window).ready(function(){
    var markers = [];
    var searchUrl = '/jobrequest.php?lat=';
    downloadUrl(searchUrl, function(data) {
           var xml = parseXml(data);                                                                                                                            
           var markerNodes = xml.documentElement.getElementsByTagName("marker");
           for (var i = 0; i < markerNodes.length; i++) {
             var id = markerNodes[i].getAttribute("id");
             var job_time = markerNodes[i].getAttribute("job_time");
             var pick_up_instructions = markerNodes[i].getAttribute("pick_up_instructions");
             var drop_off_instructions = markerNodes[i].getAttribute("drop_off_instructions");
           }
         }
       
    function display(){     
        var text = " " + job_time + " " + pick_up_instructions +" " + drop_off_instructions + " ";
        jQuery('#jobmesg').html(text);
    }

    function parseXml(str) {
          if (window.ActiveXObject) {
            var doc = new ActiveXObject('Microsoft.XMLDOM');
            doc.loadXML(str);
            return doc;
          }
        else if (window.DOMParser) {
            return (new DOMParser).parseFromString(str, 'text/xml');
        }
    }