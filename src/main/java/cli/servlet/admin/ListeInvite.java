package cli.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cli.bean.jpa.PersonneEntity;
import cli.bean.jpa.ResponsableEntity;
import cli.persistence.services.jpa.PersonnePersistenceJPA;
import cli.persistence.services.jpa.ResponsablePersistenceJPA;

/**
 * Servlet implementation class ListeInvite
 */
@WebServlet("/ListeInvite/*")
public class ListeInvite extends HttpServlet {
	
	private String  JSP_PATH ="/view/listeInvite.jsp";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeInvite() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void handleRequest(HttpServletRequest request, HttpServletResponse response){

		String pathInfo= request.getPathInfo();
		System.out.println(" yo les mec"+pathInfo+"");
		switch(pathInfo+""){
		case "/add":
			System.out.println("addpersonne");
			ajouterPersonne(request);
			break;
		case "/addResponsable":
			System.out.println("addResponsable");
			addResponsable(request);
			break;
		case "/deleteResponsable":
			deleteResponsable(request);
			break;
		case "/deleteInvite":
			deleteInvite(request);
			break;
				
		}
		AfficherListeInvite(request,response);
		RequestDispatcher rd;
		ServletContext context = this.getServletContext();
		rd = context.getRequestDispatcher(JSP_PATH);
		try
		{
			rd.forward(request, response);
		} 
		catch (Exception e) {}
		
    }
	private void deleteInvite(HttpServletRequest request) {
		String identifiant = request.getParameter("id");
		int id = Integer.valueOf(identifiant);
		try{
			new PersonnePersistenceJPA().delete(id);
		}
		catch(Exception e){
			
		}
	}

	private void deleteResponsable(HttpServletRequest request) {
		String identifiant = request.getParameter("id");
		int id = Integer.valueOf(identifiant);
		try{
			new ResponsablePersistenceJPA().delete(new ResponsablePersistenceJPA().load(id));
		}
		catch(Exception e){
			System.out.println("Erreur lors de la suppression du Responsable "+identifiant);
		}
	}

	private void addResponsable(HttpServletRequest request) {
		String nom = request.getParameter("nom");
		String mdp = request.getParameter("mdp");
		boolean estadmin = request.getParameter("estadmin").equals("on");
		
		ResponsablePersistenceJPA responsableManager = new ResponsablePersistenceJPA();
		
		ResponsableEntity responsable = new ResponsableEntity();
		responsable.setEstadmin(estadmin);
		responsable.setNom(nom);
		responsable.setMdp(mdp);
		
		responsableManager.insert(responsable);
	}

	private void ajouterPersonne(HttpServletRequest request) {
		PersonnePersistenceJPA PersonneManager = new PersonnePersistenceJPA();
		ResponsablePersistenceJPA responsableMnanger = new ResponsablePersistenceJPA();
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String mail = request.getParameter("mail");
		boolean estadulte  = request.getParameter("estAdulte").equals("on");
		boolean invitesoir = request.getParameter("inviteSoir").equals("on");
		boolean vientsoir  = request.getParameter("vientSoir").equals("on");
		boolean invitevin  = request.getParameter("inviteVin").equals("on");
		boolean vientvin   = request.getParameter("vientVin").equals("on");
		ResponsableEntity responsable = responsableMnanger.load(Integer.valueOf(request.getParameter("responsable")));
		PersonneEntity  personne = new PersonneEntity();
		
		personne.setEstadulte(estadulte);
		personne.setNom(nom);
		personne.setPrenom(prenom);
		personne.setMail(mail);
		personne.setResponsable(responsable);
		personne.setInvitesoir(invitesoir);
		personne.setVientsoir(vientsoir);
		personne.setInvitevin(invitevin);
		personne.setVientvin(vientvin);
		PersonneManager.insert(personne);
		
	}

	private void AfficherListeInvite(HttpServletRequest request, HttpServletResponse response) {
		PersonnePersistenceJPA personneManager = new PersonnePersistenceJPA();
		ResponsablePersistenceJPA responsableManager = new ResponsablePersistenceJPA();
		List<PersonneEntity> personnes = personneManager.loadByNamedQuery("PersonneEntity.ordered");
		List<ResponsableEntity> responsables = responsableManager.loadAll();
		request.setAttribute("ListeInvites", personnes);
		request.setAttribute("ListeResponsables", responsables);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
