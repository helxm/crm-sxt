package com.bjsxt.crm.po;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_development")
public class Development {
	@Id
	@GeneratedValue
	private Integer id;
	private String num;
	private String time;
	private String content;
	private String result;
	private String planTime;
	
	@ManyToOne
	@JoinColumn(unique=true)
	private MarketChance marketChance; 
	
	public Development() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MarketChance getMarketChance() {
		return marketChance;
	}

	public void setMarketChance(MarketChance marketChance) {
		this.marketChance = marketChance;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getPlanTime() {
		return planTime;
	}

	public void setPlanTime(String planTime) {
		this.planTime = planTime;
	}
}
