  <h3>Ajouter une Personne</h3>
	<div id="formulaireAjout">
		<form action="<c:url value="/ListeInvite/add"/>">
		<div id='unePersonneAjout'>
		<select name="responsable">
		<c:forEach items="${ListeResponsables}" var="resp">
			<option value="${resp.id}">${resp.nom}</option>
		</c:forEach>
		</select>
			<input id="prenom" 	name="prenom" 	type="search" placeholder="Prénom">	</input>  
			<input id="nom" 	name="nom" 		type="search" placeholder="Nom">	</input>
			<input id="mail" 	name="mail" 	type="mail"   placeholder="mail">	</input>
			<label>Est Adulte : 			 </label><input id="estAdulte"  name="estAdulte"    type="checkbox"/>
			<label>Invité au Vin d'Honneur : </label><input id="inviteVin" name="inviteVin" 	type="checkbox"/>
			<label>Vient au Vin d'Honneur :  </label><input id="vientVin" 	name="vientVin" 	type="checkbox"/>  
			<label>Invité le soir :			 </label><input id="inviteSoir" name="inviteSoir" 	type="checkbox"/> 
			<label>Vient le soir : 			 </label><input id="vientSoir" 	name="vientSoir" 	type="checkbox"/> 
		</div>
		
		<button id ="btnAjouterEnregistrer"class="btn btn-primary " type="submit">Enregistrer</button>
	</form>
	</div>
	<button id ="btnAjouterPerson"class="btn btn-primary ">+</button>
	