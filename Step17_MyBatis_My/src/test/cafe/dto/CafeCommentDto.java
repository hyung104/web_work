package test.cafe.dto;

public class CafeCommentDto {
	private int num;		// 글번호
	private String writer;
	private String content;
	private String target_id;	// 댓글의 대상이 되는 글 작성자 id
	private int ref_group;		// 댓글의 그룹번호 - board_cafe.num
	private int comment_group;	// 댓글내의 그룹
	private String regdate;
	private String deldate;	//삭제여부
	private int recommendCnt;	//추천수 
	
	public CafeCommentDto() {}

	public CafeCommentDto(int num, String writer, String content, String target_id, int ref_group, int comment_group,
			String regdate, String deldate, int recommendCnt) {
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.regdate = regdate;
		this.deldate = deldate;
		this.recommendCnt = recommendCnt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getDeldate() {
		return deldate;
	}

	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}

	public int getRecommendCnt() {
		return recommendCnt;
	}

	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}

	
}
