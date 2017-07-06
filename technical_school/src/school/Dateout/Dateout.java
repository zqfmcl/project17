package school.Dateout;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Dateout {

	/**function select_date($date)
	{
		$s=gbk_utf($date);
	    preg_match('/(?<d>\d{2})-(?<m>\d{1,2})月\s*-(?<y>\d{2})/',$s,$m);
	    return date('Y-m-d',strtotime($m['y'].'-'.$m['m'].'-'.$m['d']));
	}*/
	
	public static String date(String s) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		String dates = null;
		try {
			Date date=sdf.parse(s);
			
			 dates=(new SimpleDateFormat("yyyy-MM-dd ").format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.err.println(dates);
		return dates;
		
	}
}
