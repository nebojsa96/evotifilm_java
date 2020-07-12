package evotifilm.JPA.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import evotifilm.JPA.MainEntityManager;
import evotifilm.JPA.entity.Film;
import evotifilm.JPA.entity.Korisnik;

public class KorisnikRepository {

	static EntityManager em;
	static {
		em = MainEntityManager.getEntityManager();
	}
	
	public static Korisnik authenticate(String korisnickoIme, String sifra) {
		Query query = em.createQuery("SELECT k FROM Korisnik k WHERE k.korisnickoIme = :korisnickoIme and k.sifra = :sifra");
		query.setParameter("korisnickoIme", korisnickoIme);
		query.setParameter("sifra", sifra);
		List<Korisnik> res = query.getResultList();		
		
		if(res.size()>0)
			return res.get(0);
		return null;
	}

	public static Optional<Korisnik> register(Korisnik k) {
		Optional<Korisnik> kp = findByKorisnickoIme(k.getKorisnickoIme());
		if(kp.isEmpty())
			return save(k);
		else
			return Optional.empty();
	}
	
	public static Optional<Korisnik> findById(int id) {
		Korisnik k = em.find(Korisnik.class, id);
		
		return k != null ? Optional.of(k) : Optional.empty();
	}
	
	public static Optional<Korisnik> findByKorisnickoIme(String korisnickoIme) {
		
		Query qry = em.createQuery("SELECT k FROM Korisnik k WHERE k.korisnickoIme = :korisnickoIme");
		qry.setParameter("korisnickoIme", korisnickoIme);
		List<Korisnik> k = (List<Korisnik>) qry.getResultList();
		
		return !k.isEmpty() ? Optional.of(k.get(0)) : Optional.empty();
	}
	
	
	
	public static List<Korisnik> findAll() {
		List<Korisnik> kList = null;
		
		Query qry = em.createQuery("SELECT k FROM Korisnik k");
		kList = qry.getResultList();
		
		return kList;
	}
	
	
	
	public static Optional<Korisnik> save(Korisnik k) {
		em.getTransaction().begin();

		if(findById(k.getId()).isEmpty()){
			em.persist(k);
		} else {
			em.merge(k);
		}

		em.getTransaction().commit();
		
		return Optional.of(k);
	}
	
	
	
	public static boolean deleteById(int id) {
		Korisnik k = em.find(Korisnik.class, id);
		if( k!=null ) {
			em.getTransaction().begin();
			
			em.remove(k);
			
			em.getTransaction().commit();
			return true;
		}
		return false;
	}
}
