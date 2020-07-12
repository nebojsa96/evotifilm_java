package evotifilm.RMI;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

import evotifilm.JPA.entity.Korisnik;


public interface IKorisnikRMI extends Remote{
	public Korisnik authenticate(Korisnik k) throws RemoteException;
	public Korisnik register(Korisnik k) throws RemoteException;
	public List<Korisnik> findAll() throws RemoteException;
	public Korisnik findById(int id) throws RemoteException;
	public Korisnik save(Korisnik k) throws RemoteException;
	public boolean deleteById(int id) throws RemoteException;
	
}
