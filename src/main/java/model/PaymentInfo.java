package model;

import java.sql.Date;

public class PaymentInfo 
{
	
	private int userId;
	private String cardNumber;
	private String cardHolderName;
	private String cvv;
	private String month;
	private String year;
	private Date paidDate;
	private double paidAmount;
	
	public PaymentInfo(int userId, String cardNumber, String cardHolderName, String cvv, String month, String year,
			Date paidDate, double paidAmount) {
		super();
		this.userId = userId;
		this.cardNumber = cardNumber;
		this.cardHolderName = cardHolderName;
		this.cvv = cvv;
		this.month = month;
		this.year = year;
		this.paidDate = paidDate;
		this.paidAmount = paidAmount;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Date getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(Date paidDate) {
		this.paidDate = paidDate;
	}

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}
	
	
}
