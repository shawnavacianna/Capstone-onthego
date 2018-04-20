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
         $sql = "insert into randomclients (latitude,longitude) values ('$lat_info','$lon_info');";
         $sql2 = "insert into randomclients2 (location) values ('$location');";
         if ($conn->query($sql2)){
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