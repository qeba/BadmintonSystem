package net.codejava.javaee.badminton;


public class Book {
	protected int id;
	protected String name;
	protected String court;
	protected float price;
	protected int hour;


	public Book() {
	}

	public Book(int id) {
		this.id = id;
	}

	public Book(int id, String name, String court, float price, int hour) {
		this(name, court, price, hour);
		this.id = id;
	}
	
	public Book(String name, String court, float price, int hour) {
		this.name = name;
		this.court = court;
		this.price = price;
		this.hour = hour;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCourt() {
		return court;
	}

	public void setCourt(String court) {
		this.court = court;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}
	


}
