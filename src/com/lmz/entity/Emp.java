package com.lmz.entity;

import org.springframework.stereotype.Component;

@Component
public class Emp {
private Integer id;
private String ename;
private String esex;
private Integer eage;
private Integer sale;

public Emp() {
	super();
	// TODO Auto-generated constructor stub
}

public Emp(Integer id, String ename, String esex, Integer eage, Integer sale) {
	super();
	this.id = id;
	this.ename = ename;
	this.esex = esex;
	this.eage = eage;
	this.sale = sale;
}

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getEname() {
	return ename;
}
public void setEname(String ename) {
	this.ename = ename;
}
public String getEsex() {
	return esex;
}
public void setEsex(String esex) {
	this.esex = esex;
}
public Integer getEage() {
	return eage;
}
public void setEage(Integer eage) {
	this.eage = eage;
}
public Integer getSale() {
	return sale;
}
public void setSale(Integer sale) {
	this.sale = sale;
}

@Override
public String toString() {
	return "Emp [id=" + id + ", ename=" + ename + ", esex=" + esex + ", eage="
			+ eage + ", sale=" + sale + "]";
}

}
