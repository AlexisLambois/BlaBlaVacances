package fr.ulille.iut;

import static fr.ulille.iut.BDDFactory.getDbi;
import static fr.ulille.iut.BDDFactory.tableExist;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/projet")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class ProjetResource {
	
	final Logger logger = LoggerFactory.getLogger(ProjetResource.class);
	ProjetDAO dao = getDbi().open(ProjetDAO.class);
	UserDAO dao_user = getDbi().open(UserDAO.class);
	HobbyDAO dao_hobby = getDbi().open(HobbyDAO.class);
	
	public ProjetResource() throws SQLException {
		if (!tableExist("users_bbv")) {
			logger.debug("Create table users");
			dao_user.createTableUsers();
			dao_user.insert(new User("test", "test", "test", "test@test.fr", "test", "01 January, 2018", "0612345678"));
			dao_user.insert(new User("lol", "lol", "lol", "lol@lol.fr", "lol", "01 January, 2018", "0612345678"));
		}
		if(!tableExist("hobbies_bbv")){
			logger.debug("Create table hobbies");
			dao_hobby.createTableHobbies();
			dao_hobby.insert(new Hobby("Visite"));
			dao_hobby.insert(new Hobby("Informatique"));
			dao_hobby.insert(new Hobby("Sport"));
			dao_hobby.insert(new Hobby("Detente"));
		}
		if(!tableExist("projets_bbv")) {
			logger.debug("Create table projets & lien");
			dao.createTableProjets();
			dao.insert_base(new Projet(1,"test","test","ville","01 January, 2018","2018","2018","tente",0,0.0,"test"));
			dao.createTableLien();
			dao.createTableParticipation();
		}
	}
	
	@POST
	@Path("/particp")
	public void createParticipation(@QueryParam("user_login") String user_login,@QueryParam("no_projet") String no_projet) throws Exception {
		dao.insert_participation(no_projet,user_login);
	}
	
	@GET
	@Path("/particip/{projet_no}")
	public List<String> getUserInProject(@PathParam("projet_no") int projet_no){
		return dao.getUserInProject(projet_no);
	}
	
	@GET
	@Path("/hobbies/{projet_no}/{num}")
	public List<String> getHobbiesInProject(@PathParam("projet_no") int projet_no,@PathParam("num") int num){
		return dao.getHobbiesInProject(projet_no,num);
	}

	@POST
	public Projet createProjet(@QueryParam("divVert") String divVert,@QueryParam("divOrange") String divOrange,@QueryParam("divRouge") String divRouge,Projet p) throws Exception {
		if (Projet.validationProjet(p)) {
			throw new Exception("Inscription projet non réussie");
		} else {
			dao.insert(p);
			Pattern pattern = Pattern.compile(">([A-Za-z]+)<");
			Matcher matcher = pattern.matcher(divVert);
			while (matcher.find()) {
				String res = matcher.group();
				dao.insert_lien_bon(new Hobby(""+res.subSequence(1, res.length()-1)));
			}
			matcher = pattern.matcher(divOrange);
			while (matcher.find()) {
				String res = matcher.group();
				dao.insert_lien_moyen(new Hobby(""+res.subSequence(1, res.length()-1)));
			}
			matcher = pattern.matcher(divRouge);
			while (matcher.find()) {
				String res = matcher.group();
				dao.insert_lien_mauvais(new Hobby(""+res.subSequence(1, res.length()-1)));
			}
		}
		return p;
	}
	
	@GET
	@Path("/date/{date_creation}")
	public List<Projet> getProjetsByDate(@PathParam("date_creation") String date_creation){
		return dao.getProjetsByDate(date_creation);
	}
	
	@GET
	@Path("/byUser/{id_user}")
	public List<Projet> getProjetsByUser(@PathParam("id_user") String id_user){
		return dao.getProjetsByUser(id_user);
	}
	
	@GET
	@Path("/affinage/{ville}&{datedep}&{dateret}&{prixMin}&{prixMax}")
	public List<Projet> getProjetsAffinage(@PathParam("ville") String ville,@PathParam("datedep") String datedep,
			@PathParam("dateret") String dateret,@PathParam("prixMin") String prixMin,
			@PathParam("prixMax") String prixMax){
		return dao.getProjetsAffinage(ville,datedep,dateret,prixMin,prixMax);
	}
	
	@GET
    public List<Projet> getAllProjets() {
		return dao.getProjets();
    }

	@GET
	@Path("/{projet_no}")
	public Projet getProjet(@PathParam("projet_no") int projet_no) {
		Projet projet = dao.findByName(projet_no);
		if (projet == null) {
			throw new WebApplicationException(404);
		}
		return projet;
	}

	@DELETE
	@Path("/{projet_no}")
	public void deleteProjet(@PathParam("projet_no") int projet_no) {
		dao.delete(projet_no);
	}

}
