package school.javabean;

public class Tittle {
	String image_src;
	String tittle;
	int ID;
	String summary;
	public Tittle() {
		// TODO Auto-generated constructor stub
		this.ID=-1;
	}

	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getImage_src() {
		return image_src;
	}
	
	public void setImage_src(String image_src) {
		this.image_src = image_src;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
}
