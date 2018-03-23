package fr.ulille.iut;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.BindBean;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapperFactory;
import org.skife.jdbi.v2.tweak.BeanMapperFactory;

public interface HobbyDAO {
	
	@SqlUpdate("create table hobbies_bbv("
			+ "namehobby varchar(50),"
			+ "constraint pk_hobby primary key(namehobby))")
	void createTableHobbies();

	@SqlUpdate("drop table if exists hobbies_bbv")
	void dropTableHobbies();
	
	@SqlUpdate("insert into hobbies_bbv(namehobby) values (:namehobby)")
	int insert(@BindBean() Hobby hobby);
	
	@SqlQuery("select * from hobbies_bbv where namehobby = :namehobby")
	@RegisterMapperFactory(BeanMapperFactory.class)
	Hobby findByName(@Bind("namehobby") String namehobby);
	
	@SqlQuery("select * from hobbies_bbv")
	@RegisterMapperFactory(BeanMapperFactory.class)
	List<Hobby> getHobbies();

	@SqlUpdate("delete from hobbies_bbv where namehobby = :namehobby")
	void delete(@Bind("namehobby") String namehobby);

}
