<?php

$link = mysql_connect('172.17.0.2:3306', 'root', 'root');
if (!$link) {
    die('Error: ' . mysql_error());
}
echo 'Sucess!';
mysql_close($link);

phpInfo();
