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
if(isset($_SESSION['ID_USER']))
{?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/datatable.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <a class="navbar-brand" href="./index.html">GestionFalMontpeul</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="javascript:history.go(-1)">Mon Profil<span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0 search" method="POST" action="search.php">
            <input name="searchName" class="form-control mr-sm-2" type="search" placeholder="Recherche par surnom" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Recherche</button>
        </form>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="./disconnect.php">Déconnexion</a>
            </li>
        </ul>
    </div>
</nav>
<table id="example" class="table table-striped table-bordered" style="width:100%; text-align:center;">
    <thead>
    <tr>
        <th class="sorting">Surnom</th>
        <th>Role</th>
        <th>Baptême</th>
        <th>Filière</th>
        <th>Ajouter</th>
    </tr>
    </thead>
    <tbody>
    <?php
        $stmt=$connect->prepare("SELECT * FROM membre,filiere,role WHERE membre.id_filiere=filiere.ID_FILIERE AND membre.ID_ROLE=role.ID_ROLE");
        if ($stmt->execute()){
            $result=$stmt->fetchAll();
            foreach($result AS $membre){
                echo("<tr><td>".$membre['SURNOM_USER']."</td>");
                echo("<td>".$membre['LIB_ROLE']."</td>");
                echo("<td>".$membre['DATEBAPT_USER']."</td>");
                echo("<td>".$membre['LIB_FILIERE']."</td>");
                echo("<td><button href='#'>Ajouter</button></td></tr>");
            }
        }
    ?>
    </tbody>
</table>
</body>
</html>
<?php
	} else { header('location:index.html?error=Vous n\'avez pas accès à cette page');}
?>