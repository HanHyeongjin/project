package vo;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int rvno;
	private String id;
	private int idno;
	private String rtitle;
	private String rcontents;
	private String rvredate;
	private String nickname;
	private int score;
	private int rpcount; 

} //class
