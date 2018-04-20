<?php

//db connection
require("phpsqlsearch_dbinfo.php");
$conn = new mysqli ($host, $username, $password, $database);


     $sql = mysqli_query($conn, "SELECT firstname,lastname,contact_number,make,model FROM Driver JOIN Vehicle ON Driver.driver_id='10000009' and Vehicle.driver_id = '10000009'");
    //$sql = mysqli_query($conn, "select firstname,lastname,contact_number from Driver where driver_id ='10000009'");
    
if (!$sql) {
    die(mysqli_error($link));
}

if(mysqli_num_rows($sql)){

    while($rs=mysqli_fetch_array($sql)){

         $span.='<h4>Name:      '.$rs['firstname'].'  '.$rs['lastname'].'<p>Contact Number:      '.$rs['contact_number'].'</p> Vehicle Make:    '.$rs['make'].'</p><p>Vehicle Model:    '.$rs['model'].'</p>';
    
      }
    }
    

echo $span;

?> 
