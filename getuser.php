<!DOCTYPE html>
<html>
<head>
<style>
table {
    float:left;
    width: 50%;
    border-collapse: collapse;
}

table, td, th {
    right-border: 1px solid black;
    border: 0px solid black;
    padding: 5px;
}

th {text-align: center;}
</style>
</head>
<body>

<?php
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','root','','onthego');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"ajax_demo");
//$sql="select d.*, v.* from Driver d, Vehicle v where d.driver_id = v.driver_id  WHERE d.driver_id = '".$q."'";
//$sql="SELECT * FROM Driver WHERE driver_id = '10000009'";
$sql ="SELECT firstname,lastname,make,model,license_number FROM Driver JOIN Vehicle ON Driver.driver_id='10000009' and Vehicle.driver_id = '10000009'";

$result = mysqli_query($con,$sql);



echo "<table>
<tr>
<th>Firstname</th>
<th>Lastname</th>
<th>Make</th>
<th>Model</th>
<th>License Plate</th>
</tr>";
while($row = mysqli_fetch_array($result)) {
    echo "<tr>";
    echo "<td>" . $row['firstname'] . "</td>";
    echo "<td>" . $row['lastname'] . "</td>";
    echo "<td>" . $row['make'] . "</td>";
    echo "<td>" . $row['model'] . "</td>";
    echo "<td>" . $row['license_number'] . "</td>";
    echo "</tr>";
}
echo "</table>";
mysqli_close($con);
?>
</body>
</html>