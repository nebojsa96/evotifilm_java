package evotifilm.JPA.repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.Query;


import evotifilm.JPA.MainEntityManager;
import evotifilm.JPA.entity.Film;
import evotifilm.JPA.entity.Zanr;

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
	
	public static List<Film> findByNaziv(String naziv) {
		List<Film> fList = null;
		
		Query qry = em.createQuery("SELECT f FROM Film f WHERE LOWER(f.naziv) LIKE LOWER(:kljuc) ");
		qry.setParameter("kljuc", "%"+naziv+"%");
		fList = qry.getResultList();
		
		return fList;
	}
	
	
	
	public static Optional<Film> save(Film f) {
		em.getTransaction().begin();

		if(findById(f.getId()).isEmpty()){
			em.persist(f);
		} else {
			em.merge(f);
		}

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
	
	public static void addZanrFromZanrIds(Film f) {
		if(f.getZanroviIds().length==0)
			return;
		List<Zanr> zList = ZanrRepository.findAll();
		List<Integer> zIdsList = new ArrayList<>();
		for(int zid : f.getZanroviIds()) { zIdsList.add(zid); }
		Set<Zanr> zanrovi = new HashSet<Zanr>();
		
		for(Zanr z : zList){
			if(zIdsList.contains(z.getId())) {
				zanrovi.add(z);
			}
		}
		f.setZanrovi(zanrovi);
		
	}

}
