package com.safvan.exception.mvc.train;

import java.util.Arrays;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TrainException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private StackTraceElement[] stackTrace;
	private String userFriendlyMessage;

	public TrainException(
			StackTraceElement[] stackTrace,
			String userFriendlyMessage) {
		
		super(Arrays.toString(stackTrace));
		this.stackTrace = stackTrace;
		this.userFriendlyMessage = userFriendlyMessage;
	}
}
