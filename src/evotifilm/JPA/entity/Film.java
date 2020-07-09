package evotifilm.JPA.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="film")
public class Film {
	@Id
	@GeneratedValue
	private int id;
	private String naziv;
	private int godina;
	private String kratak_opis;
	private String opis;
	private String zakljucak;
	private String trajanje;
	private int ocena;
	private float ocena_imdb;
	private String imdb;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name="film_zanr",
				joinColumns = @JoinColumn(name="id_film"),
				inverseJoinColumns = @JoinColumn(name="id_zanr"))
	private Set<Zanr> zanrovi = new HashSet<>();
	
	public Film() {
		
	}
	
	public Film(String naziv, int godina, String kratak_opis, String opis, String zakljucak, String trajanje, int ocena,
			float ocena_imdb, String imdb) {
		super();
		this.naziv = naziv;
		this.godina = godina;
		this.kratak_opis = kratak_opis;
		this.opis = opis;
		this.zakljucak = zakljucak;
		this.trajanje = trajanje;
		this.ocena = ocena;
		this.ocena_imdb = ocena_imdb;
		this.imdb = imdb;
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

	public int getGodina() {
		return godina;
	}

	public void setGodina(int godina) {
		this.godina = godina;
	}

	public String getKratak_opis() {
		return kratak_opis;
	}

	public void setKratak_opis(String kratak_opis) {
		this.kratak_opis = kratak_opis;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getZakljucak() {
		return zakljucak;
	}

	public void setZakljucak(String zakljucak) {
		this.zakljucak = zakljucak;
	}

	public String getTrajanje() {
		return trajanje;
	}

	public void setTrajanje(String trajanje) {
		this.trajanje = trajanje;
	}

	public int getOcena() {
		return ocena;
	}

	public void setOcena(int ocena) {
		this.ocena = ocena;
	}

	public float getOcena_imdb() {
		return ocena_imdb;
	}

	public void setOcena_imdb(float ocena_imdb) {
		this.ocena_imdb = ocena_imdb;
	}

	public String getImdb() {
		return imdb;
	}

	public void setImdb(String imdb) {
		this.imdb = imdb;
	}

	public Set<Zanr> getZanrovi() {
		return zanrovi;
	}

	public void setZanrovi(Set<Zanr> zanrovi) {
		this.zanrovi = zanrovi;
	}
	
	
	
}
