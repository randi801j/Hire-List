package com.randyluc.NewHire.services;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.randyluc.NewHire.models.Listing;
import com.randyluc.NewHire.repositories.ListingRepository;

@Service
public class ListingService {
	@Autowired
	private ListingRepository repo;
	
	public Listing findById(Long id) {
		
		Optional<Listing> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Listing> all() {
		return repo.findAll();
	}
	
	public Listing create(Listing listing) {
		return repo.save(listing);
	}
	
	public Listing findListing(Long id) {
		Optional<Listing>optionalListing = repo.findById(id);
		if(optionalListing.isPresent()) {
			return optionalListing.get();
		}
		return null;
	}
	public Listing updateListing(Listing listing) {
		return repo.save(listing);
		
	}
	public void deleteListing(Listing listing) {
		repo.delete(listing);
	}
	
}



