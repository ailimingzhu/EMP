package com.lmz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lmz.dao.EmpMapper;
import com.lmz.entity.Emp;
import com.lmz.entity.Fenye;
@Service
public class EmpServiceImpl implements EmpService{
@Autowired
private EmpMapper empMapper;
	public Fenye selectEmp(Fenye fenye) {
		// TODO Auto-generated method stub
		Integer total = empMapper.selectCounts(fenye);
		List<Emp> selectEmp = empMapper.selectEmp(fenye);
		fenye.setTotal(total);
		fenye.setRows(selectEmp);
		return fenye;
	}

	public Integer deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		return empMapper.deleteEmp(id);
	}

	public Integer updateEmp(Emp emp) {
		// TODO Auto-generated method stub
		return empMapper.updateEmp(emp);
	}

	public Integer addEmp(Emp emp) {
		// TODO Auto-generated method stub
		return empMapper.addEmp(emp);
	}

}
