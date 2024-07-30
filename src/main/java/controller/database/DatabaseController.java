package controller.database;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.LoginModel;
import model.MovieModel;
import model.PasswordEncryptionWithAes;
import model.UserModel;
import util.StringUtil;

public class DatabaseController {

public Connection getConnection() throws SQLException, ClassNotFoundException{
		
	// Load the MySQL JDBC driver class
		Class.forName(StringUtil.JDBC_MYSQL_DRIVER);
	
		 // Establish a connection to the local MySQL database using the provided URL, username, and password
		return DriverManager.getConnection(StringUtil.LOCALHOST_URL, StringUtil.LOCALHOST_USER, StringUtil.LOCALHOST_PASS);
		
	}

public int UserRegister(UserModel model)
{
	
	try
	{
		// Prepare a SQL INSERT statement using the connection obtained from the getConnection() method
		PreparedStatement st = getConnection().prepareStatement(StringUtil.INSERT_SQL_QUERY);
		
		// Set values for the parameters in the prepared statement
		st.setString(1, model.getUsername());
		st.setString(2, model.getEmail());
		st.setString(3, model.getGender());		
		st.setDate(4, Date.valueOf(model.getDob()));
		st.setString(5, PasswordEncryptionWithAes.encrypt(model.getUsername(), model.getPassword()));

		int result = st.executeUpdate();
		
		if(result > 0)
		{
			return 1;
		}
		else
		{
			
			return 0;
		}
		
	}
	catch(SQLException | ClassNotFoundException ea)
	{
		
	}
	
	
	return 0;
}


public int updateMovie(MovieModel model, PrintWriter print)
{
	
	
	try
	{
		PreparedStatement st = getConnection().prepareStatement(StringUtil.INSERT_MOVIE_SQL_QUERY);
		st.setString(1, model.getMovieId());
		st.setString(2, model.getMoviename());
		st.setString(3, model.getMoviedescription());
     	st.setString(4, model.getMoviedirector());
		st.setString(5, model.getMoviecategories());
		st.setString(6, model.getMovieentertainment());
		st.setString(7, model.getMovieduration());
		st.setString(8, model.getMovieimbd());
		st.setDate(9, Date.valueOf(model.getMoviereleasedate()));
		st.setString(10, model.getMovieImageUrlFromPart());
		
		int result = st.executeUpdate();
		
		if(result > 0)
		{
			return 1;
		}
		else 
		{
			return 0;
		}
		
		
	}
	catch(SQLException | ClassNotFoundException ea)
	{
		
	}
	return 0;
}




public int getUserLoginInfo(LoginModel loginmodel)
{
	
	try
	{
		PreparedStatement st = getConnection().prepareStatement(StringUtil.GET_LOGIN_USER_INFO);
		
		st.setString(1, loginmodel.getUsername());
		
		ResultSet result = st.executeQuery();
		
		if(result.next())
		{
			String userdata = result.getString("user_name");
//			String passworddata = result.getString("password");
			
			String passworddata = PasswordEncryptionWithAes.decrypt(result.getString("password"), userdata);
			
			String role = String.valueOf(Integer.parseInt(result.getString("role_id")));
			
			if(userdata.equals(loginmodel.getUsername()) && passworddata.equals(loginmodel.getPassword()) && role.equals("98"))
			{
				return 1;
			}
			else if(userdata.equals(loginmodel.getUsername()) && passworddata.equals(loginmodel.getPassword()) && role.equals("99"))
			{				
			    return 2;
			}
			else
			{
				return 0;
			}
		}
		else
		{
			
			return -1;
			
		}
		
		
	}
	catch(SQLException | ClassNotFoundException ea)
	{
		ea.printStackTrace();
		return -2;
	}
	
	
}

public int updateMovieInfo(MovieModel model, String moviename)
{
	
	try(Connection con =  getConnection())
	{
		
		PreparedStatement st = con.prepareStatement(StringUtil.QUERY_UPDATE_MOVIE);
		
		st.setString(1, model.getMovieId());
		st.setString(2, model.getMoviename());
		st.setString(3, model.getMoviedescription());
		st.setString(4, model.getMoviedirector());
		st.setString(5, model.getMoviecategories());
		st.setString(6, model.getMovieentertainment());
		st.setString(7, model.getMovieduration());
		st.setString(8, model.getMovieimbd());
		st.setDate(9, Date.valueOf(model.getMoviereleasedate()));
		st.setString(10, model.getMovieImageUrlFromPart());
		st.setString(11, moviename);		
		int result = st.executeUpdate();
		return result;
		
	}
	catch(SQLException | ClassNotFoundException ea)
	{
		ea.printStackTrace();
		return -1;
	}
	
	
	
}


public int deleteMovieInfo(String moviename)
{
	
	try(Connection con = getConnection())
	{
		PreparedStatement st = con.prepareStatement(StringUtil.QUERY_DELETE_MOVIE);
		
		st.setString(1, moviename);
		
		return st.executeUpdate();
		
	}catch(SQLException | ClassNotFoundException ea)
	{
		
		ea.printStackTrace();
		return -1;
	}
	
	
}

public int deleteUserInfo(String username)
{
	try(Connection con = getConnection())
	{
		PreparedStatement st = con.prepareStatement(StringUtil.QUERY_USER_DELETE);
		st.setString(1, username);
		return st.executeUpdate();
		
	}catch(SQLException | ClassNotFoundException ea)
	{
		ea.printStackTrace();
		return -1;
	}
}


public int addToWatchList(String userId, String movieId)
{
	
	try(Connection con = getConnection())
	{
		PreparedStatement st = con.prepareStatement(StringUtil.QUERY_INSERT_WATCHLIST);
		st.setString(1, userId);
		st.setString(2, movieId);
		
		return st.executeUpdate();
		
	}catch(SQLException | ClassNotFoundException ea)
	{
		ea.printStackTrace();
		return -1;
	}
	
	
}

public ArrayList<UserModel> getAllUserInfo()
{
	try(Connection con = getConnection())
	{
		PreparedStatement st = con.prepareStatement(StringUtil.GET_ALL_USER_INFO);
		ResultSet rs = st.executeQuery();
		
		ArrayList<UserModel> user = new ArrayList<UserModel>();
		
		while(rs.next())
		{
			UserModel usermodel = new UserModel();
			usermodel.setUserId(rs.getString("user_id"));
			usermodel.setUsername(rs.getString("user_name"));
			usermodel.setEmail(rs.getString("email"));
			usermodel.setGender(rs.getString("gender"));
			usermodel.setDob((rs.getDate("dob")).toLocalDate());
			
			user.add(usermodel);
		}
		
		return user;
	}
	catch(SQLException | ClassNotFoundException ea)
	{
		
		ea.printStackTrace();
		return null;
		
	}
	
	
}


	
}
