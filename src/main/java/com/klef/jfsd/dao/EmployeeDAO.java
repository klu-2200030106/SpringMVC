package com.klef.jfsd.dao;

import java.util.List;

import com.klef.jfsd.model.Employee;

public interface EmployeeDAO 
{
	   public  String addEmployee(Employee employee);
	    public  List<Employee> viewallEmployees();
	    public String deleteEmployee(int eid);
	    public String updateEmployee(Employee employee);
	    public  Employee viewEmployeeById(int eid);
	    public List<Employee> searchEmployees(String searchTerm);
}
