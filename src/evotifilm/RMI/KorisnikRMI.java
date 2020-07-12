package evotifilm.RMI;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;
import java.util.Optional;

import evotifilm.JPA.entity.Korisnik;
import evotifilm.JPA.repository.KorisnikRepository;

public class KorisnikRMI extends UnicastRemoteObject implements IKorisnikRMI {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	protected KorisnikRMI() throws RemoteException {
		super();
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public Korisnik authenticate(Korisnik k) throws RemoteException {
		return KorisnikRepository.authenticate(k.getKorisnickoIme(), k.getSifra());
	}
	
	@Override
	public Korisnik register(Korisnik k) throws RemoteException {
		Optional<Korisnik> kRes = KorisnikRepository.register(k);
		if(kRes.isPresent())
			return kRes.get();
		return null;
	}

	@Override
	public List<Korisnik> findAll() throws RemoteException {
		return KorisnikRepository.findAll();
	}
	
	@Override
	public Korisnik findById(int id) throws RemoteException {
		Optional<Korisnik> kRes = KorisnikRepository.findById(id);
		if(kRes.isPresent())
			return kRes.get();
		return null;
	}


	@Override
	public Korisnik save(Korisnik k) throws RemoteException {
		Optional<Korisnik> kRes = KorisnikRepository.save(k);
		if(kRes.isPresent())
			return kRes.get();
		return null;
	}
	
	@Override
	public boolean deleteById(int id) throws RemoteException {
		return KorisnikRepository.deleteById(id);
	}






}
