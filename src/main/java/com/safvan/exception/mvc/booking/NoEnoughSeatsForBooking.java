package com.safvan.exception.mvc.booking;

import lombok.Data;

@Data
public class NoEnoughSeatsForBooking extends BookingException {

	private static final long serialVersionUID = 1L;

	public NoEnoughSeatsForBooking(
			StackTraceElement[] stackTrace, 
			String userFriendlyMessage) {
		super(stackTrace, userFriendlyMessage);
	}
}
