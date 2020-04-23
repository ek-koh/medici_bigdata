package edu.medici.hadoop.airline;

import org.apache.hadoop.io.Text;

/*
 * 	Year
	Month
	UniqueCarrier
	ArrDelay
	DepDelay
	Distance
 */
public class Airline {
	private int year;
	private int month;
	private int arrDelay;  // 도착지연시간
	private int depDelay;  // 출발지연시간
	private int distance;  // 거리(마일 기준)
	private String uniqueCarrier; // 항공사 코드
	
	private boolean arriveDelayAvailable=true;
	private boolean departureDelayAvailable=true;
	private boolean distanceAvailable=true;
	
	public Airline(Text text) {
		String[] column = text.toString().split(",");
		
		year = Integer.parseInt(column[0]);
		month = Integer.parseInt(column[1]);
		uniqueCarrier = column[8];
		
		if (!column[15].contentEquals("NA")) {
			depDelay = Integer.parseInt(column[15]);
		}else {
			departureDelayAvailable = false;
		}
		if (!column[14].contentEquals("NA")) {
			arrDelay = Integer.parseInt(column[14]);
		}else {
			arriveDelayAvailable = false;
		}
		if (!column[18].contentEquals("NA")) {
			distance = Integer.parseInt(column[18]);
		}else {
			distanceAvailable = false;
		}
		
	}
	
	public String getUniqueCarrier() {
		return uniqueCarrier;
	}

	public void setUniqueCarrier(String uniqueCarrier) {
		this.uniqueCarrier = uniqueCarrier;
	}

	public boolean isArriveDelayAvailable() {
		return arriveDelayAvailable;
	}

	public void setArriveDelayAvailable(boolean arriveDelayAvailable) {
		this.arriveDelayAvailable = arriveDelayAvailable;
	}

	public boolean isDepartureDelayAvailable() {
		return departureDelayAvailable;
	}

	public void setDepartureDelayAvailable(boolean departureDelayAvailable) {
		this.departureDelayAvailable = departureDelayAvailable;
	}

	public boolean isDistanceAvailable() {
		return distanceAvailable;
	}

	public void setDistanceAvailable(boolean distanceAvailable) {
		this.distanceAvailable = distanceAvailable;
	}

	// year
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	// month
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	// arrDelay
	public int getArrDelay() {
		return arrDelay;
	}
	public void setArrDelay(int arrDelay) {
		this.arrDelay = arrDelay;
	}
	
	// depDely
	public int getDepDelay() {
		return depDelay;
	}
	public void setDepDelay(int depDelay) {
		this.depDelay = depDelay;
	}
	
	// distance
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	
}
