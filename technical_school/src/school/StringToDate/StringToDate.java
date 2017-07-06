package school.StringToDate;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class StringToDate {
	
	 public Date transform(String temp) {
		  SimpleDateFormat formatter = new SimpleDateFormat();
		  Date date=null;
		  formatter.applyPattern("yyyy-MM-dd HH:mm:ss");
		  try {
			date=formatter.parse(temp);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return date;
		
	  }
}
