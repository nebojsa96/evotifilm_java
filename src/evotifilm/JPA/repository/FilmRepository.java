package evotifilm.JPA.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import evotifilm.JPA.MainEntityManager;
import evotifilm.JPA.entity.Film;

public class FilmRepository {
	static EntityManager em;
	
	static {
		em = MainEntityManager.getEntityManager();
	}
	
	
	
	public static Optional<Film> findById(int id) {
		Film f = em.find(Film.class, id);
		
		return f != null ? Optional.of(f) : Optional.empty();
	}
	
	
	
	public static List<Film> findAll() {
		List<Film> fList = null;
		
		Query qry = em.createQuery("SELECT f FROM Film f");
		fList = qry.getResultList();
		
		return fList;
	}
	
	
	
	public static Optional<Film> save(Film f) {
		em.getTransaction().begin();

		em.persist(f);

		em.getTransaction().commit();
		
		return Optional.of(f);
	}
	
	
	
	public static void deleteById(int id) {
		Film f = em.find(Film.class, id);
		if( f!=null ) {
			em.getTransaction().begin();
			
			f.getZanrovi().forEach(z -> {
				z.getFilmovi().remove(f);
			});
			em.remove(f);
			
			em.getTransaction().commit();
		}
	}

}
