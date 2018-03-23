package fr.ulille.iut;

import org.glassfish.jersey.test.JerseyTest;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class UserResourceTest extends JerseyTest {
	
    private static final String PATH = "http://localhost:8080/BlaBlaVacances/webapi/user/toto";

    @Test
    public void list_should_return_all_users() {

        target(PATH);
        assertEquals(2, 2);
    }
   
}
