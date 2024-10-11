package com.klef.jfsd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.model.Employee;
import com.klef.jfsd.service.EmployeeService;



@Controller
public class EmployeeController
{
	 @Autowired
	 private EmployeeService employeeService;
	 
	
     @GetMapping("home")
     public ModelAndView home()
     {
    	    ModelAndView mv=new ModelAndView();
    	    mv.setViewName("index");
    	    return mv;
     }
     @GetMapping("addemp")
     public ModelAndView addemp()
     {
    	    ModelAndView mv=new ModelAndView();
    	    mv.setViewName("addemp");
    	    return mv;
     }
     
//     @PostMapping("insertemp")
//     public ModelAndView insertemp(HttpServletRequest request) {
//         //get the data from HTML form
//         int id= Integer.parseInt(request.getParameter("eid"));
//         String name=request.getParameter("ename");
//         String gender=request.getParameter("egender");
//         String dob=request.getParameter("edob");
//         String dept=request.getParameter("edept");
//         double salary=Double.parseDouble(request.getParameter("esalary"));
//         String location=request.getParameter("elocation");
//         String email=request.getParameter("eemail");
//         String contact= request.getParameter("econtact");
//         
//         Employee emp=new Employee();
//         emp.setId(id);
//         emp.setName(name);
//         emp.setGender(gender);
//         emp.setDateofbirth(dob);
//         emp.setDepartment(dept);
//         emp.setSalary(salary);
//         emp.setLocation(location);
//         emp.setEmail(email);
//         emp.setContact(contact);
//         
//         String message=employeeService.addEmployee(emp);
//         
//         ModelAndView mv=new ModelAndView();
//         mv.setViewName("addsuccess");
//         mv.addObject("message",message);
//         
//         return mv;
//     }
     
     @PostMapping("insertemp")
     public ModelAndView insertemp(HttpServletRequest request) {
         int id = Integer.parseInt(request.getParameter("eid"));
         String name = request.getParameter("ename");
         String gender = request.getParameter("egender");
         String dob = request.getParameter("edob");
         String dept = request.getParameter("edept");
         double salary = Double.parseDouble(request.getParameter("esalary"));
         String location = request.getParameter("elocation");
         String email = request.getParameter("eemail");
         String contact = request.getParameter("econtact");

         Employee emp = new Employee();
         emp.setId(id);
         emp.setName(name);
         emp.setGender(gender);
         emp.setDateofbirth(dob);
         emp.setDepartment(dept);
         emp.setSalary(salary);
         emp.setLocation(location);
         emp.setEmail(email);
         emp.setContact(contact);

         String message;
         try {
             message = employeeService.addEmployee(emp);
         } catch (DuplicateKeyException e) {
             message = "Duplicate Entry! Employee ID already exists.";
         } catch (DataIntegrityViolationException e) {
             message = "Invalid Data! Please check the input values.";
         } catch (Exception e) {
             message = "An error occurred while adding the employee.";
         }

         ModelAndView mv = new ModelAndView();
         mv.setViewName("addemp");
         mv.addObject("message", message);

         return mv;
     }

     
     
//     @GetMapping("deleteemp")
//     public ModelAndView deleteemp()
//     {
//    	 List<Employee> emplist= employeeService.viewallEmployees();
//    	 
// 	    ModelAndView mv=new ModelAndView();
// 	    mv.addObject("emplist",emplist);
// 	    mv.setViewName("deleteemp");
// 	    return mv;
//     }
     
//     @GetMapping("delete")
//     public String deleteoperation(@RequestParam("id") int eid)
//     {
//       employeeService.deleteEmployee(eid);
//       
//       return "redirect:/deleteemp"; // redirection to specific path
//       
//     }
     
     @GetMapping("deleteemp")
     public ModelAndView deleteemp()
     {
         List<Employee> emplist = employeeService.viewallEmployees();
         
         ModelAndView mv = new ModelAndView();
         mv.addObject("emplist", emplist);
         mv.setViewName("deleteemp");
         return mv;
     }

     @GetMapping("delete")
     public String deleteoperation(@RequestParam("id") int eid)
     {
             employeeService.deleteEmployee(eid);
            return "redirect:/deleteemp";
     }
     
     
     
     @GetMapping("updateemp")
     public ModelAndView updateemp()
     {
    	    ModelAndView mv=new ModelAndView();
    	    mv.setViewName("updateemp");
    	    return mv;
     }
     
     @PostMapping("update")
     public ModelAndView updateoperation(HttpServletRequest request)
     {
       ModelAndView mv = new ModelAndView();
       
       // get the data from HTML form 
       int id = Integer.parseInt(request.getParameter("eid"));
       String name = request.getParameter("ename");
       double salary = Double.parseDouble(request.getParameter("esalary"));
       String email = request.getParameter("eemail");
       String contact = request.getParameter("econtact");
       
       Employee e = new Employee();
       e.setId(id);
       e.setName(name);
       e.setSalary(salary);
       e.setEmail(email);
       e.setContact(contact);
       
        Employee emp =  employeeService.viewEmployeeById(id); // check whether Employee object is there or not
        
        if(emp!=null)
        {
           String msg = employeeService.updateEmployee(e);
           mv.setViewName("updatesuccess");
           mv.addObject("message",msg);
        }
        else
        {
          mv.setViewName("updatefail");
          mv.addObject("message", "Employee ID Not Found");
        }
        
        return mv;
       
     }
     
     
     @GetMapping("viewallemps")
     public ModelAndView viewallemps()
     {
         List<Employee> emplist = employeeService.viewallEmployees();
         ModelAndView mv = new ModelAndView("viewallemps");
         mv.addObject("emplist", emplist);
         return mv;
     }
   
     @GetMapping("searchEmployees")
     public ResponseEntity<List<Employee>> searchEmployees(@RequestParam("searchTerm") String searchTerm) {
         List<Employee> employees = employeeService.searchEmployees(searchTerm);
         return ResponseEntity.ok(employees);
     }
     
     @GetMapping("viewempbyid")
     public ModelAndView viewempbyid()
     {
       ModelAndView mv = new ModelAndView("viewempbyid");
       return mv;
     }
     
     @PostMapping("displayemp")
     public ModelAndView displayemp(HttpServletRequest request)
     {
       ModelAndView mv = new ModelAndView();
       
       int id = Integer.parseInt(request.getParameter("eid"));  // get id from HTML form
       
         Employee emp =  employeeService.viewEmployeeById(id); 
         
          if(emp!=null)
        {
          mv.setViewName("displayemp");
          mv.addObject("emp", emp);
        }
        else
        {
          mv.setViewName("displayfail");
          mv.addObject("message", "Employee ID Not Found");
        }
        
        return mv;
        
     }
     
     
     
     
     
}
