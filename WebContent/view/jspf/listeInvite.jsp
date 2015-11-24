<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h3>Liste des Invités</h3><table class="table table-hover table-bordered">
		<thead id="thListeInvite"> 
			<td>Responsable</td>
			<td>Nom</td>
			<td>Prénom</td>
			<td>Adulte</td>
			<td>Invité au vin d'honneur</td>
			<td>Vient au vin d'honneur</td>
			<td>Invité le soir</td>
			<td>Vient le soir</td>
			<td>Action</td>
		</thead>
		<c:forEach items="${ListeInvites}" var="invite">
			<tr>
			<td>${invite.responsable.nom}</td>
			<td>${invite.nom}</td>
			<td>${invite.prenom}</td>
			<td><input name="estAdulte" type="checkbox" <c:if test="${invite.estadulte}">checked</c:if>/></td>
			<td><input name="inviteVin" type="checkbox" <c:if test="${invite.invitevin}">checked</c:if>/></td>
			<td><input name="vientVin" type="checkbox" <c:if test="${invite.vientvin}">checked</c:if>/></td>
			<td><input name="inviteSoir" type="checkbox" <c:if test="${invite.invitesoir}">checked</c:if>/></td>
			<td><input name="vientSoir" type="checkbox" <c:if test="${invite.vientsoir}">checked</c:if>/></td>
			<td><form action="<c:url value="/ListeInvite/deleteInvite"/>"><input name="id" value="${invite.id}" type="hidden"/><button type="submit">Supprimer</button></form>
		</td>
			</tr>
		</c:forEach>
		<tbody class="listeInvite"></tbody>
		
	</table>
	<button id ="valider"class="btn btn-primary btn-block">Valider les changements</button>