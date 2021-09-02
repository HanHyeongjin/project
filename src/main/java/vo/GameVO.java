package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GameVO {
	private int idno;
	private String gname;
	private String gservice;
	private String categories1;
	private String categories2;
	private int rec;
	private double grade;
	private String contents;
	private String img;
	private MultipartFile imgf;
	private int grank;
}
