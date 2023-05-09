package com.randyluc.NewHire.repositories;



import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.randyluc.NewHire.models.Listing;


@Repository
public interface ListingRepository  extends CrudRepository<Listing, Long>  {
	List<Listing>findAll();
}




