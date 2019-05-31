package com.lmz.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye {
private Integer page;
private Integer pageSize;
private Integer total;
private List<Emp> rows;

private String ename;
private String esex;
private Integer startSale;
private Integer endSale;


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
public Integer getStartSale() {
	return startSale;
}
public void setStartSale(Integer startSale) {
	this.startSale = startSale;
}
public Integer getEndSale() {
	return endSale;
}
public void setEndSale(Integer endSale) {
	this.endSale = endSale;
}
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
public Integer getPageSize() {
	return pageSize;
}
public void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
}
public Integer getTotal() {
	return total;
}
public void setTotal(Integer total) {
	this.total = total;
}
public List<Emp> getRows() {
	return rows;
}
public void setRows(List<Emp> rows) {
	this.rows = rows;
}

}
