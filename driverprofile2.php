<?php

//db connection
require("phpsqlsearch_dbinfo.php");
$conn = new mysqli ($host, $username, $password, $database);


     // $sql = mysqli_query($conn, "SELECT firstname,lastname,contactnumber,make,model FROM Driver join Vehicle where Driver.driver_id = Vehicle.driver_id");
    //$sql = mysqli_query($conn, "SELECT firstname,lastname,contactnumber FROM Driver");
    $sql = mysqli_query($conn, "select driver_id,review,stars from Rating where driver_id ='10000009'");
    
if (!$sql) {
    die(mysqli_error($link));
}

if(mysqli_num_rows($sql)){

    while($rs=mysqli_fetch_array($sql)){

         $span.='<h3>Review</h3><p>Review:  '.$rs['review'].'</p><p>Stars:  '.$rs['stars'].'</p>';
    
      }
    }
    

echo $span;

?> 
