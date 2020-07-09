package evotifilm.JPA.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import evotifilm.JPA.MainEntityManager;
import evotifilm.JPA.entity.Film;
import evotifilm.JPA.entity.Zanr;

public class ZanrRepository {
	static EntityManager em;
	
	static {
		em = MainEntityManager.getEntityManager();
	}
	
	
	public static Optional<Zanr> findById(int id) {
		Zanr z = em.find(Zanr.class, id);
		
		return z != null ? Optional.of(z) : Optional.empty();
	}
	
	
	
	public static List<Zanr> findAll() {
		List<Zanr> zList = null;
		
		Query qry = em.createQuery("SELECT z FROM Zanr z");
		zList = qry.getResultList();
		
		return zList;
	}
	
	
	
	public static Optional<Zanr> save(Zanr z) {
		em.getTransaction().begin();

		em.persist(z);

		em.getTransaction().commit();
		
		return Optional.of(z);
	}
	
	
	
	public static void deleteById(int id) {
		Zanr z = em.find(Zanr.class, id);
		if( z != null ) {
			em.getTransaction().begin();

			z.getFilmovi().forEach(f -> {
				f.getZanrovi().remove(z);
			});
			em.remove(z);
			
			em.getTransaction().commit();
		}
	}
}
