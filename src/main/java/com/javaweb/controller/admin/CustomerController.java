package com.javaweb.controller.admin;

import com.javaweb.model.dto.CustomerDTO; // Giả sử bạn đã có Service
import com.javaweb.model.request.CustomerRequest;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value = "customersControllerOfAdmin")
public class CustomerController {

        @Autowired
        private UserService userService;

        @Autowired
        private CustomerService customerService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("CustomerRequest") CustomerRequest model, HttpServletRequest request) {
        List<CustomerDTO> customerDTOList = new ArrayList<>();
        if(SecurityUtils.getAuthorities().contains("STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            model.setStaffId(staffId);
        }
        customerDTOList = customerService.findAllCustomers(model);
        model.setListResult(customerDTOList);
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("customerRequest", model);
        mav.addObject("liststaff", userService.getStaffs());
        mav.addObject("listcustomer", customerDTOList);
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO model,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("id") Long id , HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO = customerService.findCustomerById(id);
        mav.addObject("customerEdit", customerDTO);
        return mav;
    }
}