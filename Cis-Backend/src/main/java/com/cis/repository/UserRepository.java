package com.cis.repository;

import com.cis.model.User;
import com.cis.model.UserType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Long>{

	@Query("select u from User u where u.username = ?1 and u.usertype = ?2")
	User findByUsername(String username, UserType userType);
	

	@Query("select u from User u where u.usertype = ?1")
	List<User>  getAllUser(UserType userType);
	
	
	
	
}
