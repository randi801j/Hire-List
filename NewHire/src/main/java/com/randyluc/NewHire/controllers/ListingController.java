package com.randyluc.NewHire.controllers;




import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.randyluc.NewHire.models.Listing;
import com.randyluc.NewHire.models.LoginUser;
import com.randyluc.NewHire.models.User;
import com.randyluc.NewHire.services.ListingService;
import com.randyluc.NewHire.services.UserService;

@Controller
public class ListingController {
	// Add once service is implemented:
		@Autowired
		private UserService users;
		@Autowired
		private ListingService listings;
	    
	    @GetMapping("/")
	    public String index(Model model) {
	    
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        
	    	User user = users.register(newUser, result);
	    	
	        
	        if(result.hasErrors()) {
	            // Be sure to send in the empty LoginUser before 
	            // re-rendering the page.
	            model.addAttribute("newLogin", new LoginUser());
	            return "index.jsp";
	        }
	        
	 
	        session.setAttribute("userId", user.getId());
	    
	        return "redirect:/listings";
	    }
	    
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        

	        User user = users.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "index.jsp";
	        }
	    
	        session.setAttribute("userId", user.getId());
	    
	        return "redirect:/listings";
	    }
	    
	    @GetMapping("/listings")
	    public String listings(Model model, HttpSession session) {
	    	
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	
	    	model.addAttribute("listings", listings.all());
	    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
	    	return "home.jsp";
	    }
	    
	    @GetMapping("/addlisting")
	    public String addListing(@ModelAttribute("listing") Listing listing, Model model, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	User user = users.findById((Long)session.getAttribute("userId"));
	    	model.addAttribute("user", user);
	    	
	    	return "addListing.jsp";
	    }
	   
	   
	    @PostMapping("/listings")
	    public String createListing(@Valid @ModelAttribute("listing") Listing listing, BindingResult result) {

	    	if (result.hasErrors()) {
	    		return "addListing.jsp";
	    	}
	    	
	    	listings.create(listing);
	    	
	    	return "redirect:/listings";
	    }
	    
	    @GetMapping("/listings/{id}")
	    public String showListing(Model model, @PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Listing listing = listings.findById(id);
	    	model.addAttribute("listing", listing);
	    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
	    	
	    	return "show.jsp";
	    }
	   
	   
	    @GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.invalidate();
	    	return "redirect:/";
	    }
	    
	    @GetMapping ("listings/{id}/edit")
	    public String editListing(Model model, @PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Listing listing = listings.findById(id);
	    	model.addAttribute("listing", listing);
	    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
	    	
	    	return "editListing.jsp";
	    }
	    @PutMapping ("listings/{id}/edit")
	    public String updateListing(Model model,@Valid @ModelAttribute("listing")Listing listing,BindingResult result, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	if(result.hasErrors()) {
	    		return "editListing.jsp";
	    	}
	    	listings.updateListing(listing);
	    	return "redirect:/listings";
	    }
	    @GetMapping("/listings/{id}/delete")
	    public String deleteListing(@PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	Listing listing = listings.findById(id);
	    	listings.deleteListing(listing);
	    	return "redirect:/listings";
	    }
	    	    
	}


