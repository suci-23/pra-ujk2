<?php
$hostname = "localhost";
$hostusername = "root";
$password = "";
$data_base = "laundry_suci";

$config = mysqli_connect($hostname, $hostusername, $password, $data_base);
if (!$config) {
    echo "Fail to connect!";
}
