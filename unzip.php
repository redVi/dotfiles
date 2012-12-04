<?php
require_once('pclzip.lib.php');
$archive = new PclZip('archive.zip');
if ($archive->extract() == 0) {
    die("Error : ".$archive->errorInfo(true));
}else{
    echo 'ok';
}
?>
