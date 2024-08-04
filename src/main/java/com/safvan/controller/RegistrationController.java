package com.safvan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.safvan.beans.User;
import com.safvan.beans.UserRegistrationDTO;
import com.safvan.constants.endpoints.RegistrationEndpoints;
import com.safvan.service.mvc.ILoginManagementService;
import com.safvan.service.mvc.IUserManagementService;
import com.safvan.util.FileUploadUtils;
import com.safvan.util.UserUtils;

import lombok.extern.slf4j.Slf4j;

/**
 * The RegistrationController handles the registration of new users. It provides
 * endpoints for displaying the registration form and processing the
 * registration data.
 *
 * @author Safvan
 * @version 1.0
 * @since 1.0
 */
@Controller
@RequestMapping(RegistrationEndpoints.REGISTRATION_BASE_URI)
@Slf4j
public class RegistrationController {

	@Autowired
	private IUserManagementService userManagementService;

	@Autowired
	private ILoginManagementService loginManagementService;

	/**
	 * Displays the registration form for new users.
	 *
	 * @return The view name for the registration form.
	 */
	@GetMapping(RegistrationEndpoints.SHOW_REGISTRATION_FORM)
	public String showRegistarionForm() {

		return "register_user";
	}

	/**
	 * Registers a new customer based on the provided registration data.
	 *
	 * @param firstName   The first name of the user.
	 * @param lastName    The last name of the user.
	 * @param username    The username of the user.
	 * @param password    The password of the user.
	 * @param address     The address of the user.
	 * @param phoneNumber The phone number of the user.
	 * @param image       The profile image of the user (optional).
	 * @param model       The model object to pass data to the view.
	 * @return The view name for the user registration success page.
	 */

	 @PostMapping(RegistrationEndpoints.REGISTER_NEW_CUSTOMER)
	    public String registerNewCustomer(
	    		@Valid @ModelAttribute("userRegistrationDTO") UserRegistrationDTO userRegistrationDTO,
	                                      BindingResult bindingResult,
	                                      Map<String, Object> model) {
		 
		 
		 if (bindingResult.hasErrors()) {
			 
			 log.warn("Validation errors occurred during registration for user: {}", userRegistrationDTO.getUsername());
	            // Prepare a map to hold field-specific error messages
	            Map<String, String> errorMap = new HashMap<>();
	            bindingResult.getFieldErrors().forEach(error ->
	                errorMap.put(error.getField(), error.getDefaultMessage())
	            );
	            model.put("errorMap", errorMap);
	            return "register_user";
	        }
		
		// Convert the image to byte array
		byte[] imageBytes = FileUploadUtils.convertToByteArray(userRegistrationDTO.getImage());

		// Create a User object with the registration data
		User user = UserUtils.createUser(
				userRegistrationDTO.getUsername(), 
				loginManagementService.hashPassword(userRegistrationDTO.getPassword()), 
				userRegistrationDTO.getFirstName(),
				userRegistrationDTO.getLastName(),
				userRegistrationDTO.getAddress(), 
				userRegistrationDTO.getPhoneNumber(), 
				imageBytes);

		// Register the new customer
		User userRegistrationResult = userManagementService.registerNewCustomer(user);

		// Pass the registration result to the view
		model.put("userRegResult", userRegistrationResult);

		return "user_registration_success";
	}
}
