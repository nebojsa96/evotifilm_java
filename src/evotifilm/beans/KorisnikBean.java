package evotifilm.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


public class KorisnikBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String korisnickoIme;
	private String sifra;
	private String punoIme;
	private String email;
	private String tip;
	
	public KorisnikBean() {};
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKorisnickoIme() {
		return korisnickoIme;
	}
	public void setKorisnickoIme(String korisnickoIme) {
		this.korisnickoIme = korisnickoIme;
	}
	public String getSifra() {
		return sifra;
	}
	public void setSifra(String sifra) {
		this.sifra = sifra;
	}
	public String getPunoIme() {
		return punoIme;
	}
	public void setPunoIme(String punoIme) {
		this.punoIme = punoIme;
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

	public String validate(){
		String msg = "";
		if(this.korisnickoIme!=null && !this.korisnickoIme.matches("[a-zA-Z0-9]{4,15}")) {
			return "Ime mora imati izmedju 6 i 15 alfanumerickih karaktera<br>";
		}
		if(this.sifra!=null && !this.sifra.matches("^(?=.*\\d).{4,8}$")) {
			return "Sifra mora imati izmedju 4 i 8 alfanumerickih karaktera<br>";
		}
		return msg;
	}
}
