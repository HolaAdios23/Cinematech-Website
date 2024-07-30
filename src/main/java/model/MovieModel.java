package model;

import java.io.File;
import java.io.Serializable;
import java.time.LocalDate;

import javax.servlet.http.Part;

import util.StringUtil;

public class MovieModel implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private String movieId;
	private String moviename;
	private String moviedirector;
	private String moviecategories;
	private String movieimbd;
	private String moviedescription;
	private LocalDate moviereleasedate;
	private String movieduration;
	private String movieentertainment;
	private String movieimageURLFromPart;

	public MovieModel(String movieId, String moviename, String moviedescription, String moviedirector, String moviecategories, String movieduration, String movieentertainment,  String movieimbd,LocalDate moviereleasedate,Part movieimageURLFromPart) {
		this.movieId = movieId;
		this.moviename = moviename;
		this.moviedescription = moviedescription;
		this.moviedirector = moviedirector;
		this.moviecategories = moviecategories;
		this.movieduration = movieduration;
		this.movieentertainment = movieentertainment;
		this.movieimbd = movieimbd;
		this.moviereleasedate = moviereleasedate;
		this.movieimageURLFromPart = getImageUrl(movieimageURLFromPart);
		
	}
	public MovieModel()
	{
		
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getMoviedirector() {
		return moviedirector;
	}
	public void setMoviedirector(String moviedirector) {
		this.moviedirector = moviedirector;
	}
	public String getMoviecategories() {
		return moviecategories;
	}
	public void setMoviecategories(String moviecategories) {
		this.moviecategories = moviecategories;
	}
	public String getMovieimbd() {
		return movieimbd;
	}
	public void setMovieimbd(String movieimbd) {
		this.movieimbd = movieimbd;
	}
	public String getMoviedescription() {
		return moviedescription;
	}
	public void setMoviedescription(String moviedescription) {
		this.moviedescription = moviedescription;
	}
	public LocalDate getMoviereleasedate() {
		return moviereleasedate;
	}
	public void setMoviereleasedate(LocalDate moviereleasedate) {
		this.moviereleasedate = moviereleasedate;
	}
	public String getMovieduration() {
		return movieduration;
	}
	public void setMovieduration(String movieduration) {
		this.movieduration = movieduration;
	}
	public String getMovieentertainment() {
		return movieentertainment;
	}
	
	public void setMovieentertainment(String movieentertainment) {
		this.movieentertainment = movieentertainment;
	}
	
	
	public String getMovieImageUrlFromPart()
	{
		return movieimageURLFromPart;
	}
	
	public void setMovieImageUrlFromPart(Part part)
	{
		this.movieimageURLFromPart = getImageUrl(part);
	}
	
	public void setImageUrlFromDB(String imageUrl)
	{
		this.movieimageURLFromPart = imageUrl;
	}
	
	public String getImageUrl(Part imagePart)
	{
		String savePath = StringUtil.IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if(!fileSaveDir.exists())
		{
			fileSaveDir.mkdir();
		}
		
		String contentDisp = imagePart.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s : items)
		{
			
			if(s.trim().startsWith("filename"))
			{
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
			
		}
		if(imageUrlFromPart == null || imageUrlFromPart.isEmpty())
		{
			imageUrlFromPart = "transformer.jpg";
		}
		return imageUrlFromPart;
		
		
		
	}

}
