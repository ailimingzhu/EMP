package com.lmz.service;



import com.lmz.entity.Emp;
import com.lmz.entity.Fenye;

public interface EmpService {
	Fenye selectEmp(Fenye fenye);

	public Integer deleteEmp(Integer id);

	public Integer updateEmp(Emp emp);

	public Integer addEmp(Emp emp);
}
