package com.cis.repository;

import com.cis.model.Shout;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ShoutRepository extends JpaRepository<Shout, Long> {
	
	@Query("select s from Shout s where s.shouterId = ?1")
	public List<Shout> getShoutsOfShouter(long shouterId);

	@Query("select s from Shout s where s.categoryId in (select sub.categoryId From Subscription sub where sub.actionTakerId = ?1) ")
	public List<Shout> getShoutsOfProvider(long providerId);
	

}
