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
 * Servlet implementation class KorisnikTypeServlet
 */
@WebServlet("/rest_type_korisnik")
public class KorisnikTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KorisnikTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("korisnik") == null || session.getAttribute("tip") == null) {
			response.sendRedirect("page_login.jsp");
			return;
		}
		if(session.getAttribute("tip") != "admin") {
			response.sendRedirect("page_login.jsp");
			return;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		String tip = (String)request.getParameter("tip");
		IKorisnikRMI server;
		try {
			server = (IKorisnikRMI)Naming.lookup("rmi://localhost:1098/KorisnikRMI");
			Korisnik k = server.findById(id);
			k.setTip(tip);
			k = server.save(k);
			
			response.sendRedirect("page_korisnici.jsp");
		} catch (MalformedURLException | RemoteException | NotBoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
