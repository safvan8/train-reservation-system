package com.safvan.service;

import java.util.List;

import com.safvan.beans.Train;
import com.safvan.execption.TrainException;
import com.safvan.execption.TrainNotFoundException;

public interface ITrainService {
	
	// to get all trains from DB
	public List<Train> getAllTrains();
	
	public Train getTrainByNumber(Long trainNo) throws TrainNotFoundException;
	
	public String addTrain(Train train) throws TrainException;
	
	public String deleteTrain(Long trainNo) throws TrainNotFoundException;
}
