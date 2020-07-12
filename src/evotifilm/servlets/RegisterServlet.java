package evotifilm.servlets;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import evotifilm.JPA.entity.Korisnik;
import evotifilm.RMI.IKorisnikRMI;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/rest_register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Korisnik kb = new Korisnik();
		kb.setPunoIme((String)request.getParameter("punoIme"));
		kb.setKorisnickoIme((String)request.getParameter("korisnickoIme"));
		kb.setSifra((String)request.getParameter("sifra"));
		kb.setSifra2((String)request.getParameter("sifra2"));
		kb.setEmail((String)request.getParameter("email"));
		kb.setTip("korisnik");
		
		HttpSession session=request.getSession();  
		
		String validateMsg = kb.validateRegistration();
		if(!validateMsg.equals("")){
			session.setAttribute("msg_error", validateMsg);
			response.sendRedirect("page_register.jsp");
		} else {
			try {
				IKorisnikRMI server = (IKorisnikRMI)Naming.lookup("rmi://localhost:1098/KorisnikRMI");
				Korisnik k = server.register(kb);
				if(k!=null){
					session.setAttribute("korisnik", k.getKorisnickoIme());
					session.setAttribute("tip", k.getTip());
					response.sendRedirect("page_home.jsp");
						} else {		
					session.setAttribute("msg_error", "Korisničko ime zauzeto");
					response.sendRedirect("page_login.jsp");		
				}
			} catch (MalformedURLException | RemoteException | NotBoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
