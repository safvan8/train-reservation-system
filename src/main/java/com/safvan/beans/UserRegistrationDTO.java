package com.safvan.beans;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserRegistrationDTO {

    @NotEmpty(message = "First name must not be empty.")
    private String firstName;

    @NotEmpty(message = "Last name must not be empty.")
    private String lastName;

    @NotEmpty(message = "Username must not be empty.")
    @Size(min = 3, max = 20, message = "Username must be between 3 and 20 characters.")
    private String username;

    @NotEmpty(message = "Password must not be empty.")
    @Size(min = 6, message = "Password must be at least 6 characters long.")
    private String password;

    @NotEmpty(message = "Address must not be empty.")
    private String address;

    @NotEmpty(message = "Phone number must not be empty.")
    @Pattern(regexp = "\\d{10}", message = "Phone number must be a 10-digit number.")
    private String phoneNumber;

    private MultipartFile image;

}
