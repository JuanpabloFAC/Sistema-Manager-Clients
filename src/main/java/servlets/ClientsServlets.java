package servlets;

import java.io.IOException;
import java.sql.SQLException;

import dao.ClientDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Client;

public class ClientsServlets extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private ClientDao dao;
	public ClientsServlets() throws ClassNotFoundException, SQLException {
		super();
		dao = new ClientDao();
	}
	
	//protected -> classes no mesmo pacote e por subclasses
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		String forward="";
		
		if(action==null) {
			action="default";
		}
		
		switch(action) {
		
			case "edit":
				
				RequestDispatcher edit = request.getRequestDispatcher("admin-create.jsp"); //chama add
				
				int clientid = Integer.parseInt(request.getParameter("clientId"));
				Client client = dao.getClientById(clientid);
				request.setAttribute("client", client);
				edit.forward(request, response);
				
				
				break;
		
			case "delete":
			
				clientid = Integer.parseInt(request.getParameter("clientId"));
				dao.deleteClient(clientid);
				
				RequestDispatcher del = request.getRequestDispatcher("admin-update-delete.jsp");
				request.setAttribute("clients", dao.getAllClients());
				del.forward(request, response);
				break;
		
			case "clients":
				
				RequestDispatcher clients = request.getRequestDispatcher("clients.jsp");
				request.setAttribute("clients", dao.getAllClients());
				clients.forward(request, response);
				break;
				
			case "admincreate":
				
				RequestDispatcher adminc = request.getRequestDispatcher("admin-create.jsp");
				//request.setAttribute("courses", dao.getAllCourses());
				adminc.forward(request, response);
				break;
				
			case "admin-ud":
				
				RequestDispatcher adminud = request.getRequestDispatcher("admin-update-delete.jsp");
				request.setAttribute("clients", dao.getAllClients());
				adminud.forward(request, response);
				break;
		
			default:
				
				RequestDispatcher home = request.getRequestDispatcher("home.jsp");
				//request.setAttribute("courses", dao.getAllCourses());
				home.forward(request, response);
				break;
		}
		
		//RequestDispatcher view = request.getRequestDispatcher(forward);
		//view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String clientPhoneParameterString = request.getParameter("phone");
		
		Client client = new Client();
		
		client.setClientName(request.getParameter("clientname"));
		client.setClientEmail(request.getParameter("email"));
		client.setClientCpf(request.getParameter("cpf"));
		client.setClientPhone(Integer.parseInt(clientPhoneParameterString));
		client.setClientCredibility(request.getParameter("credibility"));
		client.setClientStatus(request.getParameter("status"));
		
		String clientid = request.getParameter("clientId");
		
		if(clientid == null || clientid.isEmpty()) {
					
					try {
						dao.addClient(client);
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
					
		} else {
			client.setClientId(Integer.parseInt(clientid));
			dao.updateClient(client);
					
		}
		RequestDispatcher list = request.getRequestDispatcher("admin-update-delete.jsp");
		request.setAttribute("clients", dao.getAllClients());
		list.forward(request, response);
	}
}
