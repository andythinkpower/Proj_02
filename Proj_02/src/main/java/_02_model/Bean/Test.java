package _02_model.Bean;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Test {
	
	@Id
	private Integer number;
	private Blob photo;
	

	public static void main(String[] args) {
				

	}


	public Integer getNumber() {
		return number;
	}


	public void setNumber(Integer number) {
		this.number = number;
	}


	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}


	@Override
	public String toString() {
		return "Test [number=" + number + ", photo=" + photo + "]";
	}
	
	

}
