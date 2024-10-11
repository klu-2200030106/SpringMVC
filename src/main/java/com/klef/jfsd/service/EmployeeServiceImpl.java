package com.klef.jfsd.service;

import java.util.List;

import com.klef.jfsd.dao.EmployeeDAO;
import com.klef.jfsd.model.Employee;

public class EmployeeServiceImpl implements EmployeeService
{
     private EmployeeDAO employeeDAO;
	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	@Override
	public String addEmployee(Employee employee) {
		return employeeDAO.addEmployee(employee);
	}

	@Override
	public List<Employee> viewallEmployees() {
		return employeeDAO.viewallEmployees();
	}

	@Override
	public String deleteEmployee(int eid) {
		return employeeDAO.deleteEmployee(eid);
	}

	@Override
	public String updateEmployee(Employee employee) {
		return employeeDAO.updateEmployee(employee);
	}

	@Override
	public Employee viewEmployeeById(int eid) {
		return employeeDAO.viewEmployeeById(eid);
	}
	
	 @Override
	    public List<Employee> searchEmployees(String searchTerm) {
	        return employeeDAO.searchEmployees(searchTerm);
	    }
	     
}
