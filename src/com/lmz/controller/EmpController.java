package com.lmz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lmz.entity.Emp;
import com.lmz.entity.Fenye;
import com.lmz.service.EmpService;

@Controller
public class EmpController {
	@Autowired
	private Fenye fenye;
	@Autowired
	private EmpService empService;

	@RequestMapping(value = "/getEmp", method = RequestMethod.POST)
	@ResponseBody
	public Fenye getEmp(Integer page, Integer rows,String ename,String esex,Integer startSale,Integer endSale) {
		fenye.setEname(ename);
		fenye.setEsex(esex);
		fenye.setStartSale(startSale);
		fenye.setEndSale(endSale);
		
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye=empService.selectEmp(fenye);
		return fenye;
	}
	@RequestMapping(value="/updateEmp",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateEmp(Emp emp) {
		return empService.updateEmp(emp);
		
	}
	@RequestMapping(value="/deleteEmp",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteEmp(Integer id){
		return empService.deleteEmp(id);
	}
	@RequestMapping(value="/addEmp",method=RequestMethod.POST)
	@ResponseBody
	public Integer addEmp(Emp emp){
		return empService.addEmp(emp);
	}
}
