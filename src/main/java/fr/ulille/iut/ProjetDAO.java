package fr.ulille.iut;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.BindBean;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapperFactory;
import org.skife.jdbi.v2.tweak.BeanMapperFactory;
import org.skife.jdbi.v2.unstable.BindIn;

public interface ProjetDAO {

	@SqlUpdate("create table projets_bbv("
			+ "projet_no int,"
			+ "name varchar(50),"
			+ "description varchar(500),"
			+ "lieu varchar(20),"
			+ "date_creation varchar(100),"
			+ "datedep varchar(16),"
			+ "dateret varchar(16),"
			+ "typeH varchar(20),"
			+ "nb_participant int,"
			+ "prix float,"
			+ "user_createur varchar(20),"
			+ "constraint pk_projet primary key(projet_no),"
			+ "constraint fk_user_createur foreign key(user_createur) references users_bbv(login))")
	void createTableProjets();
	
	@SqlUpdate("create table lienprojethobby_bbv("
			+ "projet_no int,"
			+ "namehobby varchar(50),"
			+ "avis int check(avis between 0 and 2),"
			+ "constraint pk_lienprojethobby primary key(projet_no,namehobby),"
			+ "constraint fk_projets_bbv foreign key(projet_no) references projets_bbv(projet_no),"
			+ "constraint fk_hobbies_bbv foreign key(namehobby) references hobbies_bbv(namehobby))")
	void createTableLien();

	@SqlUpdate("create table participe_a("
			+ "projet_no int,"
			+ "login_user varchar(20),"
			+ "constraint pk_lienprojethobby primary key(projet_no,login_user),"
			+ "constraint fk_projets_bbv foreign key(projet_no) references projets_bbv(projet_no),"
			+ "constraint fk_users_bbv foreign key(login_user) references users_bbv(login_user))")
	void createTableParticipation();
	
	@SqlUpdate("drop table if exists projets_bbv")
	void dropTableProjets();
	
	@SqlUpdate("drop table if exists lienprojethobby_bbv")
	void dropTableLien();

	@SqlUpdate("drop table if exists participe_a")
	void dropTableParticipation();
	
	@SqlUpdate("insert into projets_bbv(projet_no,name,description,lieu,date_creation,datedep,dateret,typeH,nb_participant,prix,user_createur) values(:projet_no,:name,:description,:lieu,:date_creation,:datedep,:dateret,:typeH,:nb_participant,:prix,:user_createur)")
	int insert_base(@BindBean() Projet projet);
	
	@SqlUpdate("insert into projets_bbv(projet_no,name,description,lieu,date_creation,datedep,dateret,typeH,nb_participant,prix,user_createur) values((select max(projet_no)+1 from projets_bbv),:name,:description,:lieu,:date_creation,:datedep,:dateret,:typeH,:nb_participant,:prix,:user_createur)")
	int insert(@BindBean() Projet projet);
	
	@SqlUpdate("insert into lienprojethobby_bbv values((select max(projet_no) from projets_bbv),:namehobby,0)")
	int insert_lien_mauvais(@BindBean() Hobby hobby);
	
	@SqlUpdate("insert into lienprojethobby_bbv values((select max(projet_no) from projets_bbv),:namehobby,1)")
	int insert_lien_moyen(@BindBean() Hobby hobby);
	
	@SqlUpdate("insert into lienprojethobby_bbv values((select max(projet_no) from projets_bbv),:namehobby,2)")
	int insert_lien_bon(@BindBean() Hobby hobby);

	@SqlUpdate("insert into participe_a values(:projet_no,:user_login)")
	int insert_participation(@Bind("projet_no") String projet_no,@Bind("user_login") String user_login);

	@SqlQuery("select * from projets_bbv where projet_no = :projet_no")
	@RegisterMapperFactory(BeanMapperFactory.class)
	Projet findByName(@Bind("projet_no") int projet_no);
	
	@SqlQuery("select * from projets_bbv")
	@RegisterMapperFactory(BeanMapperFactory.class)
	List<Projet> getProjets();
	
	@SqlQuery("select * from projets_bbv where date_creation = :date_creation")
	@RegisterMapperFactory(BeanMapperFactory.class)
	List<Projet> getProjetsByDate(@Bind("date_creation") String date_creation);

	@SqlQuery("select distinct name,lieu,datedep,dateret,user_createur from projets_bbv INNER join lienprojethobby_bbv on lienprojethobby_bbv.projet_no=projets_bbv.projet_no "
			+ "where lieu = :ville and datedep = :datedep and dateret = :dateret and prix between :prixMin and :prixMax")
	@RegisterMapperFactory(BeanMapperFactory.class)
	List<Projet> getProjetsAffinage(@Bind("ville") String ville,@Bind("datedep") String datedep,@Bind("dateret") String dateret,
			@Bind("prixMin") String prixMin,@Bind("prixMax") String prixMax);

	@SqlQuery("select namehobby from lienprojethobby_bbv where projet_no = :projet_no AND avis = :num")
	List<String> getHobbiesInProject(@Bind("projet_no") int projet_no,@Bind("num") int num);
	
	@SqlQuery("select * from projets_bbv where user_createur = :id_user")
	@RegisterMapperFactory(BeanMapperFactory.class)
	List<Projet> getProjetsByUser(@Bind("id_user") String id_user);
	
	@SqlQuery("select login_user from participe_a where projet_no = :projet_no")
	List<String> getUserInProject(@Bind("projet_no") int projet_no);
	
	@SqlUpdate("delete from projets_bbv where projet_no = :projet_no")
	void delete(@Bind("projet_no") int projet_no);

}
