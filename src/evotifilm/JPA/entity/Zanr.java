package evotifilm.JPA.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="zanr")
public class Zanr {
	@Id
	@GeneratedValue
	private int id;
	private String naziv;
	
	@ManyToMany(mappedBy="zanrovi", fetch = FetchType.LAZY)
	private Set<Film> filmovi = new HashSet<>();
	
	public Zanr() {
		
	}

	public Zanr(int id, String naziv) {
		super();
		this.id = id;
		this.naziv = naziv;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public Set<Film> getFilmovi() {
		return filmovi;
	}

	public void setFilmovi(Set<Film> filmovi) {
		this.filmovi = filmovi;
	}
	
	
}
