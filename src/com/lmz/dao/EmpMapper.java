package com.lmz.dao;

import java.util.List;

import com.lmz.entity.Emp;
import com.lmz.entity.Fenye;

public interface EmpMapper {
	Integer selectCounts(Fenye fenye);

	List<Emp> selectEmp(Fenye fenye);

	Integer deleteEmp(Integer id);

	Integer updateEmp(Emp emp);

	Integer addEmp(Emp emp);
}
