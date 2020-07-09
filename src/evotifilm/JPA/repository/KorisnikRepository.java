package evotifilm.JPA.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import evotifilm.JPA.MainEntityManager;
import evotifilm.JPA.entity.Korisnik;

public class KorisnikRepository {

	static EntityManager em;
	static {
		em = MainEntityManager.getEntityManager();
	}
	
	public static Korisnik authenticate(String korisnickoIme, String sifra) {
		Query query = em.createQuery("SELECT k FROM Korisnik k WHERE k.korisnicko_ime = :korisnickoIme and k.sifra = :sifra");
		query.setParameter("korisnickoIme", korisnickoIme);
		query.setParameter("sifra", sifra);
		List<Korisnik> res = query.getResultList();		
		
		if(res.size()>0)
			return res.get(0);
		return null;
	}
	
}
