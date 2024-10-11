package com.klef.jfsd.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.model.Employee;

@Transactional
public class EmployeeDAOImpl implements EmployeeDAO
{
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public String addEmployee(Employee employee)
	{
		     hibernateTemplate.persist(employee);
		     return "Employee Added Sucessfully";
	}
   
	@Override
	public List<Employee> viewallEmployees() 
	{
		   return hibernateTemplate.loadAll(Employee.class);
	}

	@Override
	public String deleteEmployee(int eid) 
	{
	    Employee e= hibernateTemplate.get(Employee.class,eid);
	    hibernateTemplate.delete(e);
	    return "Employee Deleted Successfully";
	}

	@Override
	public String updateEmployee(Employee employee) {
		Employee e= hibernateTemplate.get(Employee.class,employee.getId());
		e.setName(employee.getName());
		e.setSalary(employee.getSalary());
		e.setContact(employee.getContact());
	    e.setEmail(employee.getEmail());
		return "Employee Updated Successfully";
	}

	@Override
	public Employee viewEmployeeById(int eid) {
	    // Retrieve the employee object by ID
	    Employee e = hibernateTemplate.get(Employee.class, eid);
	    
	    // Return the retrieved employee object
	    return e;
	}
     
	@Override
	public List<Employee> searchEmployees(String searchTerm) {
	    String hql = "FROM Employee e WHERE " +
	                 "CAST(e.id AS string) LIKE :likeTerm OR " +
	                 "LOWER(e.name) LIKE :likeTerm OR " +
	                 "LOWER(e.department) LIKE :likeTerm OR " +
	                 "LOWER(e.location) LIKE :likeTerm OR " +
	                 "LOWER(e.email) LIKE :likeTerm OR " +
	                 "LOWER(e.contact) LIKE :likeTerm";
	    Query query = hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql);
	    query.setParameter("likeTerm", "%" + searchTerm.toLowerCase() + "%");
	    return query.list();
	}
}
