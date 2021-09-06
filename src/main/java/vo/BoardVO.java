package vo;

import lombok.Data;

@Data
// => 정의된 모든 필드에 대한 
//   Getter, Setter, ToString 과 같은 모든 요소를 한번에 만들어주는 어노테이션.
public class BoardVO {
	private int seq;
	private String title;
	private String id;
	private String content;
	private String regdate;
	private int cnt;


} //class
