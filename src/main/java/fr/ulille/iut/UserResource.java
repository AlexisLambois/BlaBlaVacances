package fr.ulille.iut;

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

import static fr.ulille.iut.BDDFactory.getDbi;
import static fr.ulille.iut.BDDFactory.tableExist;

@Path("/user")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)

public class UserResource {
	final Logger logger = LoggerFactory.getLogger(UserResource.class);
	UserDAO dao = getDbi().open(UserDAO.class);

	public UserResource() throws SQLException {
		if (!tableExist("users_bbv")) {
			logger.debug("Create table users");
			dao.createTableUsers();
			dao.insert(new User("test", "test", "test", "test@test.fr", "test", "01 January, 2018", "0612345678"));
		}
	}

	@POST
	public User createUser(User u) throws Exception {
		if (!User.validationUser(u)) {
			throw new Exception("Inscription non réussie");
		} else {
			dao.insert(u);
		}
		return u;
	}
	
	@GET
    public List<User> getAllUsers() {
		return dao.getUsers();
    }

	@GET
	@Path("/{login}")
	public User getUser(@PathParam("login") String login) {
		User user = dao.findByName(login);
		if (user == null) {
			throw new WebApplicationException(404);
		}
		return user;
	}

	@DELETE
	@Path("/{login}")
	public void deleteUser(@PathParam("login") String login) {
		dao.delete(login);
	}
}
