<?php


//db connection
require("phpsqlsearch_dbinfo.php");
$conn = new mysqli ($host, $username, $password, $database);


     // $sql = mysqli_query($conn, "SELECT firstname,lastname,contactnumber,make,model FROM Driver join Vehicle where Driver.driver_id = Vehicle.driver_id");
    //$sql = mysqli_query($conn, "SELECT firstname,lastname,contactnumber FROM Driver");
    $sql = mysqli_query($conn, "SELECT driver_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, alias, job_time from Jobs where driver_id='10000009'");
    
if (!$sql) {
    die(mysqli_error($link));
}

if(mysqli_num_rows($sql)){

    while($rs=mysqli_fetch_array($sql)){
         $span.='<p> Client Name:  '.$rs['alias'].'</p><p>Time:  '.$rs['job_time'].'</p><p>'.$rs['pick_up_instructions'].'</p><p>'.$rs['drop_off_instructions'].'</p><button>Accept</button><button>Decline</button><button onclick="myFunction()">Show details</button>';
    
      }
    }
    

echo $span;

?> 
