package com.cis.controllers;

import com.cis.model.ApiResponse;
import com.cis.model.Status;
import com.cis.model.User;
import com.cis.repository.UserRepository;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
@CrossOrigin(value = "*", maxAge = 3600)
public class UserGetController {

	@Autowired
	private UserRepository userRepository;

	ApiResponse res = new ApiResponse();

	@PostMapping("/add")
	public ApiResponse addCategory(@RequestBody User user) throws Exception {
		res.getData().put("user", user);

		try {
			userRepository.save(user);
			res.setMsg("User aded Successfuly !");
			res.setStatus(Status.success);

		} catch (Exception ex) {
			res.setStatus(Status.failed);
			if (ex.getCause() instanceof ConstraintViolationException) {
				res.setMsg("User already exists");
			} else {
				res.setMsg("Failed to add user");
			}

		}
		return res;

	}

	

	@PostMapping("/update")
	public ApiResponse update(@RequestBody User user) throws Exception {
		res.getData().put("user", user);

		try {
			userRepository.save(user);
			res.setMsg("User updated Successfuly !");
			res.setStatus(Status.success);

		} catch (Exception ex) {
			res.setStatus(Status.failed);
			if (ex.getCause() instanceof ConstraintViolationException) {
				res.setMsg("User already exists");
			} else {
				res.setMsg("Failed to add user");
			}

		}
		return res;

	}
	
	
	@PostMapping("/delete")
	public ApiResponse deleteCategory(@RequestBody User user) throws Exception {

		try {
			userRepository.delete(user);
			res.setMsg("User Deleted Successfuly !");
			res.getData().put("user", user);
			res.setStatus(Status.success);
		}  catch (Exception e) {
			res.getData().put("user", user);
			res.setMsg(" failed to delete user !");
			res.setStatus(Status.failed);
		}

		return res;

	}
	
	@GetMapping("/getOne/{id}")
	public ApiResponse getOne(@PathVariable(value = "id") long id) throws Exception {

		try {
		User user =  userRepository.findById(id).get();
			res.setMsg("All users loaded Successfuly !");
			res.getData().put("user", user);
			res.setStatus(Status.success);
		}   catch (Exception e) {
			res.getData().put("user", null);
			res.setMsg(e.getMessage());
			res.setStatus(Status.failed);
		}

		return res;

	}
	
	@GetMapping("/getAll")
	public ApiResponse getAll() throws Exception {

		try {
		List<User> cats =	(List<User>) userRepository.findAll();
			res.setMsg("All users loaded Successfuly !");
			res.getData().put("user", cats);
			res.setStatus(Status.success);
		}   catch (Exception e) {
			res.getData().put("user", null);
			res.setMsg(e.getMessage());
			res.setStatus(Status.failed);
		}

		return res;

	}
	

}
