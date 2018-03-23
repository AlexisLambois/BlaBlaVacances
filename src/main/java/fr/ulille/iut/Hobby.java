package fr.ulille.iut;

public class Hobby {
	private String namehobby;

	public Hobby() {
	}

	public Hobby(String namehobby) {
		super();
		this.namehobby = namehobby;
	}

	public String getNamehobby() {
		return namehobby;
	}

	public void setNamehobby(String namehobby) {
		this.namehobby = namehobby;
	}

	public static boolean validationHobby(Hobby hobby) {
		return false;
	}
}
