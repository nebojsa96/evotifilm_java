package evotifilm.JPA.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="korisnik")
public class Korisnik {
	@Id
	private int id;
	private String korisnicko_ime;
	private String sifra;
	private String puno_ime;
	private String email;
	private String tip;
	
	public Korisnik() {};
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKorisnickoIme() {
		return korisnicko_ime;
	}
	public void setKorisnickoIme(String korisnicko_ime) {
		this.korisnicko_ime = korisnicko_ime;
	}
	public String getSifra() {
		return sifra;
	}
	public void setSifra(String sifra) {
		this.sifra = sifra;
	}
	public String getPunoIme() {
		return puno_ime;
	}
	public void setPunoIme(String puno_ime) {
		this.puno_ime = puno_ime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
}
