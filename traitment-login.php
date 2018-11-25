<?php
	session_start();
	try
	{
	    $connect = new PDO('mysql:host=localhost;dbname=GestionFal;charset=utf8', 'root', 'password');
	}
	catch (Exception $e)
	{
	    die('Erreur : ' . $e->getMessage());
	}
	$login= htmlspecialchars($_POST['login']);
	$pass= htmlspecialchars($_POST['pass']);
	$recovery_user = $connect->prepare("SELECT * FROM USER WHERE LOGIN = ? AND PASSWORD = ?");
	$recovery_user->execute(array($login,sha1($pass)));
	if($recovery_user->rowcount() == 1){
		$info_user = $recovery_user->fetch();
		$_SESSION['ID_USER']=$info_user['ID_USER'];
		$_SESSION['NOM_USER']=$info_user['NOM_USER'];
		$_SESSION['PRENOM_USER']=$info_user['PRENOM_USER'];
		$_SESSION['LOGIN']=$info_user['LOGIN'];
		$_SESSION['PASSWORD']=$info_user['PASSWORD'];
		$_SESSION['ROLE_USER']=$info_user['ROLE_USER'];

		if($_SESSION['ROLE_USER']=="professeur"){
			header('location:espace-prof.php');
		} elseif ($_SESSION['ROLE_USER']=="eleve"){
			header('location:espace-eleve.php');
		} elseif ($_SESSION['ROLE_USER']=="administrateur"){
			header('location:espace-admin.php');
		}
	}
?>