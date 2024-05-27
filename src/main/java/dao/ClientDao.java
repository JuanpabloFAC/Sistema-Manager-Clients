package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConnect;
import model.Client;





public class ClientDao {
	
	Connection connection;
	
	public ClientDao() throws ClassNotFoundException, SQLException{
		connection = DbConnect.getConnection();
	}
	
	public void addClient (Client client) throws SQLException {
		
		try {
			
			PreparedStatement pst = connection.prepareStatement("insert into clients(clientName,clientCpf,clientEmail,clientPhone,clientCredibility,clientStatus) " + 
			"values(?,?,?,?,?,?)");
			
			pst.setString(1, client.getClientName());
			pst.setString(2, client.getClientCpf());
			pst.setString(3, client.getClientEmail());
			pst.setInt(4, client.getClientPhone());
			pst.setString(5, client.getClientCredibility());
			pst.setString(6, client.getClientStatus());
			
			pst.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}
	
	public void deleteClient(int clientId) {
			
		try {
			PreparedStatement pst = connection.prepareStatement("delete from clients where clientId=?");
				pst.setInt(1, clientId);
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
	}
	
	public void updateClient(Client client) {
			
		try {
				PreparedStatement pst = connection.prepareStatement("update clients set "
						+ "clientName=?,clientCpf=?,clientEmail=?,clientPhone=?,clientCredibility=?,clientStatus=?"
						+ " where clientId=?"
						);
				
				pst.setString(1, client.getClientName());
				pst.setString(2, client.getClientCpf());
				pst.setString(3, client.getClientEmail());
				pst.setInt(4, client.getClientPhone());
				pst.setString(5, client.getClientCredibility());
				pst.setString(6, client.getClientStatus());
				pst.setLong(7, client.getClientId());
				
				pst.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
	}
	
	public Client getClientById(int clientId) {

		Client client = new Client();
		
		try {
			
			PreparedStatement pst = connection.prepareStatement("select * from clients where clientId=?");
			pst.setInt(1, clientId);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				
				client.setClientName(rs.getString("clientName"));
				client.setClientCpf(rs.getString("clientCpf"));
				client.setClientEmail(rs.getString("clientEmail"));
				client.setClientPhone(rs.getInt("clientPhone"));
				client.setClientCredibility(rs.getString("clientCredibility"));
				client.setClientStatus(rs.getString("clientStatus"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return client;
	}
	
	public List<Client> getAllClients(){
		
		List<Client> clients = new ArrayList<Client>();
		
		try {
			
			java.sql.Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			ResultSet rs = statement.executeQuery("select * from clients");
			
			while(rs.next()) {
				
				Client client = new Client();
				
				client.setClientId(rs.getLong("clientId"));
				client.setClientName(rs.getString("clientName"));
				client.setClientCpf(rs.getString("clientCpf"));
				client.setClientEmail(rs.getString("clientEmail"));
				client.setClientPhone(rs.getInt("clientPhone"));
				client.setClientCredibility(rs.getString("clientCredibility"));
				client.setClientStatus(rs.getString("clientStatus"));
				
				clients.add(client);
				
			}
			
			if(rs.first()) {
				System.out.println("coming");
			}else {
				System.out.println("No data");
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return clients;
		
	}
	
}
