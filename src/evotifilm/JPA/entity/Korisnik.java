package evotifilm.JPA.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="korisnik")
public class Korisnik implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	@Column(name="korisnicko_ime")
	private String korisnickoIme;
	@Column(name="sifra")
	private String sifra;
	@Transient
	private String sifra2;
	@Column(name="puno_ime")
	private String punoIme;
	@Column(name="email")
	private String email;
	@Column(name="tip")
	private String tip;
	
	public Korisnik() {
		
	};
	
	public Korisnik(int id, String korisnickoIme, String sifra, String punoIme, String email, String tip) {
		super();
		this.id = id;
		this.korisnickoIme = korisnickoIme;
		this.sifra = sifra;
		this.punoIme = punoIme;
		this.email = email;
		this.tip = tip;
	}

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
	public String getSifra2() {
		return sifra2;
	}

	public void setSifra2(String sifra2) {
		this.sifra2 = sifra2;
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
	
	public String validateLogin(){
		String msg = "";
		if(this.korisnickoIme!=null && !this.korisnickoIme.matches("[a-zA-Z0-9]{4,15}")) {
			return "Ime mora imati izmedju 6 i 15 alfanumerickih karaktera<br>";
		}
		if(this.sifra!=null && !this.sifra.matches("^(?=.*\\d).{4,8}$")) {
			return "Sifra mora imati izmedju 4 i 8 alfanumerickih karaktera<br>";
		}
		return msg;
	}
	
	public String validateRegistration(){
		String msg = "";
		if(this.punoIme!=null && !this.punoIme.matches("[a-zA-Z ]{6,32}")) {
			return "Ime i prezime moraju imati najmanje 6 karaktera<br>";
		}
		if(this.korisnickoIme!=null && !this.korisnickoIme.matches("[a-zA-Z0-9]{4,15}")) {
			return "Ime mora imati između 4 i 15 alfanumeričkih karaktera<br>";
		}
		if(this.sifra!=null && !this.sifra.matches("^(?=.*\\d).{4,8}$")) {
			return "Šifra mora imati između 4 i 8 alfanumeričkih karaktera<br>";
		}
		if(!this.sifra.equals(this.sifra2)) {
			return "Šifre se ne podudaraju";
		}
		if(this.email!=null && !this.email.matches("^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$")) {
			return "Email adresa nije u odgovarajućem formatu<br>";
		}
		
		return msg;
	}
}
