package com.safvan.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.safvan.constants.UserRole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDTO {

	@NotNull(message = "User ID cannot be null")
	private Integer userId;

	@NotBlank(message = "Username cannot be blank")
	@Size(min = 3, max = 40, message = "Username must be between 3 and 40 characters")
	private String username;

	@NotBlank(message = "Password cannot be blank")
	@Size(min = 8, message = "Password must be at least 8 characters long")
	private String password;

	@NotNull(message = "Role cannot be null")
	private UserRole role;

	private String sessionId;

	private UserProfile userProfile;
}
