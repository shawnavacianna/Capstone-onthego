<?php

//db connection
require("phpsqlsearch_dbinfo.php");
$conn = new mysqli ($host, $username, $password, $database);
//$mealtype = $_GET["str"];
//query
//$sql=mysql_query("SELECT meal_id,meal_name FROM Meal");
//$rs=mysqli_fetch_array($sql);

//if($mealtype == "Breakfast"){
      $sql = mysqli_query($conn, "SELECT driver_id,firstname,lastname,status FROM Driver");



if(mysqli_num_rows($sql)){
$select= '<select name="select" id="drivernames" onchange="showUserDetails()">';
while($rs=mysqli_fetch_array($sql)){
      if ($rs['status'] == 'available'){
        $select.='<option value="'.$rs['driver_id'].'onchange="showUser('.$rs['driver_id'].')">'.$rs['firstname'].' '.$rs['lastname'].'</option>';
      }

  }
}
$select.='</select>';
echo $select;
?> 