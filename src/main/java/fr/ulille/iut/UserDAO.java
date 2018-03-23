package fr.ulille.iut;

import java.util.List;

import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.BindBean;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapperFactory;
import org.skife.jdbi.v2.tweak.BeanMapperFactory;

public interface UserDAO {
    @SqlUpdate("create table users_bbv(login varchar(20), name varchar(30), firstname varchar(30), email varchar(100), "
    		+ "password varchar(64), dateofbirth varchar(100), phonenumber varchar(10), role varchar(10), constraint pk_users primary key (login))")
	void createTableUsers();
    
    @SqlUpdate("drop table if exists users_bbv")
    void dropTableUsers();
    
    @SqlUpdate("insert into users_bbv(login,name,firstname,email,password,dateofbirth,phonenumber,role) values (:login,:name,:firstname,:email,:password,:dateofbirth,:phonenumber,:role)")
    int insert(@BindBean() User user);
    
    @SqlQuery("select * from users_bbv where login = :login")
    @RegisterMapperFactory(BeanMapperFactory.class)
    User findByName(@Bind("login") String login);
    
    @SqlQuery("select * from users_bbv")
    @RegisterMapperFactory(BeanMapperFactory.class)
    List<User> getUsers();
    
    @SqlUpdate("delete from users_bbv where login = :login")
    void delete(@Bind("login") String login);

}
