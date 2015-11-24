<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/RezRes/CSS/dash.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
   <!--<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>-->

<title>List des invités</title>
</head>
<body>

 <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Audren+Cyril</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Listes des invités</a></li>
            <li><a href="#about">Se Connecter</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	


	<ul class="nav nav-tabs">
	<li id="ongletConnection" class="active"><a data-toggle="tab" href="#seconnecter">Se Connecter</a></li>
	<li id="Liste" ><a data-toggle="tab" href="#home">Liste des Invités</a></li>
	<li><a data-toggle="tab" href="#AddP">Ajouter une personne</a></li>
	<li><a data-toggle="tab" href="#AddResponsable">Ajouter un Responsable</a></li>
</ul>

<div class="tab-content">
<div id="seconnecter" class="tab-pane fade in active">
    <h3>Merci de vous identifier</h3>
    <label>Nom de Famille</label> <input type=text id="connexionNom"/><br/>
	<label>Mot de passe</label><input type=text id="connexionpwd">
	<button id ="connexion"class="btn btn-primary btn-block">Go!</button>
 
  </div>
  
  <div id="home" class="tab-pane fade ">
    <jsp:include page="jspf/listeInvite.jsp"/>
  </div>
  
  <div id="AddP" class="tab-pane fade">
  <jsp:include page="jspf/AddPersonne.jsp"></jsp:include>
  </div>
  
  <div id="AddResponsable" class="tab-pane fade">
   <h3>Ajouter un Nom de famille responsable</h3>
	<div id="formulaireAjout">
		<form action="<c:url value="/ListeInvite/addResponsable"/>">
		<div id='unePersonneAjout'>
			<input name="nom"id="nom" type="search" placeholder="Nom"></input>
			<input name="mdp"id="mdp" type="password" placeholder="Mot de passe"></input>
			<label>Est administrateur : </label><input name ="estadmin" id="estadmin" type="checkbox"/>
		</div>
		
		<button id ="btnAjouterEnregistrer"class="btn btn-primary " type="submit">Enregistrer</button>
	</form>
	</div>
     <h3>Liste des responsables de famille</h3>
     <table class="table table-hover table-bordered"><thead><td>ID</td><td>Nom</td><td>Mot de passe<td>Administrateur</td><td>Action</td></thead>
  		<c:forEach items="${ListeResponsables}" var="resp">
			<tr>
			<td>${resp.id}</td>
			<td>${resp.nom}</td>
			<td>${resp.mdp}</td>
			<td>${resp.estadmin}</td>
			<td><form action="<c:url value="/ListeInvite/deleteResponsable"/>" method="post">
				<input name="id" value="${resp.id}" type="hidden">
				<button>Supprimer</button></form>
		</c:forEach>
		</table>
	<button id ="btnAjouterPerson"class="btn btn-primary ">+</button>
	
  </div>
</div>

</body>
</html>