<?php

$envVars = [
  "DB_PORT_3306_TCP_PORT",
  "DB_PORT_3306_TCP_ADDR",
  "DB_ENV_MYSQL_USER",
  "DB_ENV_MYSQL_DATABASE",
  "DB_ENV_MYSQL_PASSWORD",
  "DB_ENV_MYSQL_ROOT_PASSWORD",
];
foreach ($envVars as $envVar) {
  $envValue = getenv($envVar);
  echo nl2br("<b>{$envVar}</b>: {$envValue}\n");
}

echo nl2br("\n");
$link = mysql_connect('db', 'root', 'root') or die('Error: ' . mysql_error());
echo nl2br("Connection successfully completed! (mysql)\n");
mysql_close($link);

$link = mssql_connect('RELEASEK', 'SA', 'XPT2000') or die('Error: ' . mssql_get_last_message());
echo nl2br("Connection successfully completed! (mssql)\n");
mssql_close($link);

echo nl2br("\n");
phpInfo();
