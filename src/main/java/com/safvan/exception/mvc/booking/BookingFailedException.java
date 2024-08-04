package com.safvan.exception.mvc.booking;

import lombok.Data;

@Data
public class BookingFailedException extends BookingException {

	private static final long serialVersionUID = 1L;

	public BookingFailedException(
			StackTraceElement[] stackTrace, 
			String userFriendlyMessage) {
		super(stackTrace, userFriendlyMessage);
	}
}
