package evotifilm.JPA;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class MainEntityManager {
	private static EntityManagerFactory emf = null;
	private static EntityManager em = null;
	
	private MainEntityManager() {
		
	}
	
	public static EntityManager getEntityManager() {
		if(em == null) {
			emf = Persistence.createEntityManagerFactory("EclipseLink-JPA");
			em = emf.createEntityManager();
		}
		return em;
	}
	
	
}
