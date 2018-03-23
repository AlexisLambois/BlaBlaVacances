package fr.ulille.iut;

import java.security.Principal;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class User implements Principal {

	final static Logger logger = LoggerFactory.getLogger(User.class);
	private String name,firstname,login,email,password,dateofbirth,phonenumber,role;

	public User(String login, String name, String firstname, String email, String password, String dateofbirth,
			String phonenumber) {
		super();
		this.name = name;
		this.firstname = firstname;
		this.login = login;
		this.email = email;
		this.password = password;
		this.dateofbirth = dateofbirth;
		this.phonenumber = phonenumber;
		this.role = "user";
	}

	public User(String login, String name, String firstname, String email, String password, String dateofbirth,
			String phonenumber,String role) {
		super();
		this.name = name;
		this.firstname = firstname;
		this.login = login;
		this.email = email;
		this.password = password;
		this.dateofbirth = dateofbirth;
		this.phonenumber = phonenumber;
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", firstname=" + firstname + ", login=" + login + ", email=" + email
				+ ", password=" + password + ", dateofbirth=" + dateofbirth + ", phonenumber=" + phonenumber + ", role="
				+ role + "]";
	}



	public User(String login) {
		this.login = login;
	}

	public User(String login, String name) {
		this.login = login;
		this.name = name;
	}

	public User() {
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getName() {
		return name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void resetPasswordHash() {
		if (password != null && !password.isEmpty()) {
			setPassword(getPassword());
		}
	}

	private static boolean validationLogin(String login) {
		if (login != null && login.trim().length() != 0) {
			if (!login.matches("([a-zA-Z1-9]{3,20})")) {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}

	private static boolean validationTexte(String texte) {
		if (texte != null && texte.trim().length() != 0) {
			if (!texte.matches("([a-zA-Z]{3,30})")) {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}

	private static boolean validationEmail(String email) {
		if (email != null && email.trim().length() != 0) {
			if (!email.matches("[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\\.[a-z]{2,4}")) {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}

	private static boolean validationNumTel(String numtel) {
		if (numtel != null && numtel.trim().length() != 0) {
			if (!numtel.matches("(03|06|07)[0-9]{8}")) {
				return false;
			}
		} else {
			return false;
		}
		return true;
	}

	public static Date DateParsed(String date) {
		java.util.Date dateparsed = null;
		try {
			String[] mois = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
					"October", "November", "December" };
			String[] moisChiffre = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };

			date = date.replace(",", "");
			date = date.replace(" ", "/");

			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			for (int i = 0; i < 12; i++) {
				if (date.contains(mois[i])) {
					date = date.replace(mois[i], moisChiffre[i]);
				}
			}
			dateparsed = format.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Date(dateparsed.getTime());
	}

	private static boolean validationDateNaiss(Date date) {
		Date actualDate = new Date(System.currentTimeMillis());
		if (date.after(actualDate)) {
			return false;
		}
		return true;
	}

	public static boolean validationUser(User u) {
		try {
			if(u.getDateofbirth() != null && !u.getDateofbirth().equals("")){
				if(!validationDateNaiss(DateParsed(u.getDateofbirth()))){
					return false;
				}
			}
			if(u.getPhonenumber() != null && !u.getDateofbirth().equals("")){
				if(!validationNumTel(u.getPhonenumber())){
					return false;
				}
			}
			return (validationLogin(u.getLogin()) && validationTexte(u.getName()) && validationTexte(u.getFirstname()) && validationEmail(u.getEmail()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
