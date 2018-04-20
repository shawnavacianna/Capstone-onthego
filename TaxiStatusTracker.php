<?php
$location = filter_input(INPUT_POST,'location');

        $host = "localhost";
        $dbusername = "root";
        $dbpassword = "";
        $dbname = "onthego";
 // Creating connection
 $conn = new mysqli ($host, $dbusername, $dbpassword, $dbname);
 if (mysqli_connect_error()){
     die('Connect Error ('. mysqli_connect_errno().')'. mysqli_connect_error());
     }
     else{
         $lat_info=$_POST['lat_info'];
         $lon_info=$_POST['lon_info'];
         //$sql = "insert into drivers (lat,lng) values ('$lat_info','$lon_info') WHERE id == 5;";
         $sql = "UPDATE Driver SET lat = $lat_info, lng = $lon_info WHERE name = 'Riddim Boss';";
         $sql = "UPDATE Driver SET  status= 'Available' WHERE driver_id='$user';";

         if ($conn->query($sql)){
          echo "New record was successfully inserted into our database!";
         }

            
        
        else{
            echo "Error: ". $sql ."<br>". $conn->error;
            }
            $conn->close();
     }

 //        mysql_query($query) or die (mysql_error());
   //      }
?>