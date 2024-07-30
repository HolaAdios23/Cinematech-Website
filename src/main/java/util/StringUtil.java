package util;

import java.io.File;

public class StringUtil {

	public final static String JDBC_MYSQL_DRIVER = "com.mysql.jdbc.Driver";
	public final static String LOCALHOST_URL = "jdbc:mysql://localhost:3306/user_registration";
	public final static String LOCALHOST_USER = "root";
	public final static String LOCALHOST_PASS = "";
	
	public final static String INSERT_SQL_QUERY = "INSERT INTO user (role_id, user_name, email, gender, dob, password) VALUES (98, ?, ?, ?, ?, ?)";
	
	
	public final static String GET_LOGIN_USER_INFO = "SELECT * FROM user WHERE user_name = ?";
	
	public final static String GET_ALL_USER_INFO = "SELECT * FROM user";

	
	
	//Add or Update Movie Query
	
	public final static String INSERT_MOVIE_SQL_QUERY = "INSERT INTO movies_info(movie_id, movie_name, description, director, categories, entertainment, duration, imdb, release_date, movie_image) VALUES (?,?,?,?,?,?,?,?,?,?)";
	public final static String QUERY_DELETE_MOVIE = "DELETE FROM movies_info WHERE movie_name = ?";
	public final static String QUERY_UPDATE_MOVIE = "UPDATE movies_info SET movie_id = ?, movie_name = ?, description = ?, director = ?, categories = ?, entertainment = ?, duration = ?, imdb = ?, release_date = ?, movie_image = ? WHERE movie_name = ?";
	
	
	public final static String QUERY_USER_DELETE = "DELETE FROM user WHERE user_name = ? AND role_id = 98";
	public final static String QUERY_INSERT_WATCHLIST = "INSERT INTO watchlist(user_id, movie_id) VALUES (?,?)";
	//---------------------------------------------//
	
	//Image Path 
	public static final String IMAGE_DIR = "Users\\rezon\\eclipse-workspace\\Cinematech2\\src\\main\\webapp\\resources\\";
	public static final String IMAGE_DIR_SAVE_PATH = "C:/" + IMAGE_DIR + "movie\\";
	//////////////
	
	
	//parameter of names
	public static final String USERNAME = "username";
	public static final String PASSWORD = "password";
	
	
	//Login Page Message
	public static final String MESSAGE_ERROR_LOGIN = "Either username or password is incorrect!";
	
	
	
	//other error message name
	public static final String MESSAGE_ERROR_ATTRIBUTE = "errorMessage";
	
	
	
	//JSP Navigation
	public static final String PAGE_LOGIN = "/pages/login.jsp";


}
