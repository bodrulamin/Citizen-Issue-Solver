package com.cis.controllers;

import com.cis.model.ApiResponse;
import com.cis.model.Status;
import com.cis.model.Subscription;
import com.cis.repository.SubscriptionRepository;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/subscription")
@CrossOrigin(value = "*", maxAge = 3600)
public class SubscriptionController {

	@Autowired
	private SubscriptionRepository subscriptionRepository;

	ApiResponse res = new ApiResponse();

	@PostMapping("/add")
	public ApiResponse addSubscription(@RequestBody Subscription subscription) throws Exception {
		res.getData().put("subscription", subscription);

		try {
			subscriptionRepository.save(subscription);
			res.setMsg("Subscription aded Successfuly !");
			res.setStatus(Status.success);

		} catch (Exception ex) {
			res.setStatus(Status.failed);
			if (ex.getCause() instanceof ConstraintViolationException) {
				res.setMsg("Subscription already exists");
			} else {
				res.setMsg("Failed to add subscription");
			}

		}
		return res;

	}

	

	@PostMapping("/update")
	public ApiResponse update(@RequestBody Subscription subscription) throws Exception {
		res.getData().put("subscription", subscription);

		try {
			subscriptionRepository.save(subscription);
			res.setMsg("Subscription updated Successfuly !");
			res.setStatus(Status.success);

		} catch (Exception ex) {
			res.setStatus(Status.failed);
			if (ex.getCause() instanceof ConstraintViolationException) {
				res.setMsg("Subscription already exists");
			} else {
				res.setMsg("Failed to add subscription");
			}

		}
		return res;

	}
	
	
	@PostMapping("/delete")
	public ApiResponse deleteSubscription(@RequestBody Subscription subscription) throws Exception {

		try {
			subscriptionRepository.delete(subscription);
			res.setMsg("Subscription Deleted Successfuly !");
			res.getData().put("subscription", subscription);
			res.setStatus(Status.success);
		}  catch (Exception e) {
			res.getData().put("subscription", subscription);
			res.setMsg(" failed to delete subscription !");
			res.setStatus(Status.failed);
		}

		return res;

	}
	
	@GetMapping("/getOne/{id}")
	public ApiResponse getOne(@PathVariable(value = "id") long id) throws Exception {

		try {
		Subscription subscription =  subscriptionRepository.findById(id).get();
			res.setMsg("All categories loaded Successfuly !");
			res.getData().put("subscription", subscription);
			res.setStatus(Status.success);
		}   catch (Exception e) {
			res.getData().put("subscription", null);
			res.setMsg(e.getMessage());
			res.setStatus(Status.failed);
		}

		return res;

	}
	
	@GetMapping("/getAll")
	public ApiResponse getAll() throws Exception {

		try {
		List<Subscription> cats =	(List<Subscription>) subscriptionRepository.findAll();
			res.setMsg("All categories loaded Successfuly !");
			res.getData().put("subscription", cats);
			res.setStatus(Status.success);
		}   catch (Exception e) {
			res.getData().put("subscription", null);
			res.setMsg(e.getMessage());
			res.setStatus(Status.failed);
		}

		return res;

	}
	

}
