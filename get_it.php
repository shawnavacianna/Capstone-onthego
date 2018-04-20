<?php /*

  //--------------------------------------------------------------------------
  // Connect to mysql database
  //--------------------------------------------------------------------------
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

  //--------------------------------------------------------------------------
  // 2) Query database for data
  //--------------------------------------------------------------------------
            $result = mysql_query("SELECT * FROM $other");          //query
            $array = mysql_fetch_row($result);                          //fetch result    
        }
  //--------------------------------------------------------------------------
  // 3) echo result as json 
  //--------------------------------------------------------------------------
  echo json_encode($array);
*/
$con = mysqli_connect("localhost","root","","onthego");
$result = mysqli_query($con,"Select * from User");
while($rows = mysqli_fetch_array($result))
echo $rows['username'];
echo"<br>";
?>
