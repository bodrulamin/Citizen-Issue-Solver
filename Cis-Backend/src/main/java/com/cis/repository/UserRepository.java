package com.cis.repository;

import com.cis.model.User;
import com.cis.model.UserType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Long>{


	List<User> findUsersByUsername(String username);

	List<User> findAllByUsertype(UserType userType);

	
	
	
	
}
