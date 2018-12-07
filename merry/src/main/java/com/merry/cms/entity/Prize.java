package com.merry.cms.entity;

public class Prize {
	private Long prizeId;       //主键
	private String name;     //名称
	private String info;//描述
	private String type;//类型
	private int probability;//概率
	private int prizeNumber;//奖品奖值
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getProbability() {
		return probability;
	}
	public void setProbability(int probability) {
		this.probability = probability;
	}
	public int getPrizeNumber() {
		return prizeNumber;
	}
	public void setPrizeNumber(int prizeNumber) {
		this.prizeNumber = prizeNumber;
	}
	public Long getPrizeId() {
		return prizeId;
	}
	public void setPrizeId(Long prizeId) {
		this.prizeId = prizeId;
	}
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
