package evotifilm.RMI;

import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;



public class RMIServer {
	public static void main(String[] args) {
		try {
			KorisnikRMI korisnikRmi = new KorisnikRMI();
			LocateRegistry.createRegistry(1098);
			Naming.rebind("//localhost:1098/KorisnikRMI", korisnikRmi);
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}
}
