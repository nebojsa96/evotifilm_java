package evotifilm.JPA.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="film")
public class Film implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	@Column(name="naziv")
	private String naziv;
	@Column(name="godina")
	private int godina;
	@Column(name="kratak_opis")
	private String kratakOpis;
	@Column(name="opis")
	private String opis;
	@Column(name="zakljucak")
	private String zakljucak;
	@Column(name="trajanje")
	private String trajanje;
	@Column(name="ocena")
	private int ocena;
	@Column(name="ocena_imdb")
	private float ocenaImdb;
	@Column(name="imdb")
	private String imdb;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name="film_zanr",
				joinColumns = @JoinColumn(name="id_film"),
				inverseJoinColumns = @JoinColumn(name="id_zanr"))
	private Set<Zanr> zanrovi = new HashSet<>();
	
	@Transient 
	private int[] zanroviIds;
	
	public Film() {
		
	}
	
	public Film(String naziv, int godina, String kratakOpis, String opis, String zakljucak, String trajanje, int ocena,
			float ocenaImdb, String imdb) {
		super();
		this.naziv = naziv;
		this.godina = godina;
		this.kratakOpis = kratakOpis;
		this.opis = opis;
		this.zakljucak = zakljucak;
		this.trajanje = trajanje;
		this.ocena = ocena;
		this.ocenaImdb = ocenaImdb;
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

	public String getKratakOpis() {
		return kratakOpis;
	}

	public void setKratakOpis(String kratakOpis) {
		this.kratakOpis = kratakOpis;
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

	public float getOcenaImdb() {
		return ocenaImdb;
	}

	public void setOcenaImdb(float ocenaImdb) {
		this.ocenaImdb = ocenaImdb;
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

	public int[] getZanroviIds() {
		return zanroviIds;
	}

	public void setZanroviIds(int[] zanroviIds) {
		this.zanroviIds = zanroviIds;
	}
	
	public void appendZanr(Zanr z) {
		for (Zanr zanr : zanrovi) {
			if(zanr.getId() == z.getId())
				return;
		}
		this.zanrovi.add(z);
	}
	
	
	
}
