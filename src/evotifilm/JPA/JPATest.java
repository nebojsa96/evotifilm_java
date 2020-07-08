package evotifilm.JPA;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import evotifilm.JPA.entity.Korisnik;

public class JPATest {

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("EclipseLink-JPA");
		System.out.println("Is opened connection: "+emf.isOpen());
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		
		Korisnik k1 = new Korisnik();
		k1.setKorisnickoIme("nebojsa");
		k1.setPunoIme("Nebojsa Sretenovic");
		k1.setSifra("12345");
		k1.setEmail("nebojsa.sretenovic96@gmail.com");
		k1.setTip("admin");
		
		em.persist(k1);
		
		em.getTransaction().commit();
		
		em.close();
		emf.close();
		
	}

}
