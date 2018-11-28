
<?php
session_start();
session_destroy();
header('location:index.html?error=Vous êtes bien déconnecté.');
exit;
?>
