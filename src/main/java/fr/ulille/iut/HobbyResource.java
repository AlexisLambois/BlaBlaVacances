package fr.ulille.iut;

import static fr.ulille.iut.BDDFactory.getDbi;
import static fr.ulille.iut.BDDFactory.tableExist;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/hobby")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class HobbyResource {
	
	final Logger logger = LoggerFactory.getLogger(HobbyResource.class);
	HobbyDAO dao = getDbi().open(HobbyDAO.class);
	
	public HobbyResource() throws SQLException {
		if (!tableExist("hobbies_bbv")) {
			logger.debug("Create table hobbies");
			dao.createTableHobbies();
			dao.insert(new Hobby("Sport"));
			dao.insert(new Hobby("Detente"));
			dao.insert(new Hobby("Visite"));
		}
	}
	

	@POST
	public Hobby createHobby(Hobby h) throws Exception {
		if (Hobby.validationHobby(h)) {
			throw new Exception("Insertion hobby non réussie");
		} else {
			dao.insert(h);
		}
		return h;
	}
	
	@GET
    public List<Hobby> getAllHobbies() {
		return dao.getHobbies();
    }

	@GET
	@Path("/{namehobby}")
	public Hobby getHobby(@PathParam("namehobby") String namehobby) {
		Hobby hobby = dao.findByName(namehobby);
		if (hobby == null) {
			throw new WebApplicationException(404);
		}
		return hobby;
	}

	@DELETE
	@Path("/{namehobby}")
	public void deleteHobby(@PathParam("namehobby") String namehobby) {
		dao.delete(namehobby);
	}

}
