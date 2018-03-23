package fr.ulille.iut;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Projet implements Principal{

	final static Logger logger = LoggerFactory.getLogger(Projet.class);
	private int projet_no,nb_participant;
	private String lieu,name,description,date_creation,datedep,dateret,typeH,user_createur;
	private double prix;
	
	public Projet(int projet_no, String name, String description, String lieu, String date_creation, String datedep,String dateret,
			String typeH, int nb_participant, double prix, String user_createur) {
		super();
		this.projet_no = projet_no;
		this.name = name;
		this.description = description;
		this.lieu = lieu;
		this.date_creation = date_creation;
		this.datedep = datedep;
		this.dateret = dateret;
		this.typeH = typeH;
		this.nb_participant = nb_participant;
		this.prix = prix;
		this.user_createur = user_createur;
	}

	public Projet(String name, String description, String lieu, String date_creation, String datedep,String dateret,
			String typeH, int nb_participant, double prix, String user_createur) {
		super();
		this.name = name;
		this.description = description;
		this.lieu = lieu;
		this.date_creation = date_creation;
		this.datedep = datedep;
		this.dateret = dateret;
		this.typeH = typeH;
		this.nb_participant = nb_participant;
		this.prix = prix;
		this.user_createur = user_createur;
	}

	public Projet(int projet_no) {
		this.projet_no=projet_no;
	}
	
	public Projet() {
		
	}
	
	public int getProjet_no() {
		return projet_no;
	}


	public void setProjet_no(int projet_no) {
		this.projet_no = projet_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getLieu() {
		return lieu;
	}


	public void setLieu(String lieu) {
		this.lieu = lieu;
	}


	public String getDate_creation() {
		return date_creation;
	}


	public void setDate_creation(String date_creation) {
		this.date_creation = date_creation;
	}

	public String getDatedep() {
		return datedep;
	}

	public void setDatedep(String datedep) {
		this.datedep = datedep;
	}

	public String getDateret() {
		return dateret;
	}

	public void setDateret(String dateret) {
		this.dateret = dateret;
	}

	public String getTypeH() {
		return typeH;
	}

	public void setTypeH(String typeH) {
		this.typeH = typeH;
	}

	public int getNb_participant() {
		return nb_participant;
	}


	public void setNb_participant(int nb_participant) {
		this.nb_participant = nb_participant;
	}


	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public String getUser_createur() {
		return user_createur;
	}


	public void setUser_createur(String user_createur) {
		this.user_createur = user_createur;
	}


	//TODO A Completer
	public static boolean validationProjet(Projet projet) {
		return false;
	}

}
