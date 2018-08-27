package test.cafe.dto;

public class CafeRecommendDto {
	private int num;
	private String recommender;
	private String regdate;
	
	public CafeRecommendDto() {}

	public CafeRecommendDto(int num, String recommender, String regdate) {
		this.num = num;
		this.recommender = recommender;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRecommender() {
		return recommender;
	}

	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
