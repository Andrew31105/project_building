package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.CustomerRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {
    List<CustomerDTO> findAllCustomers(CustomerRequest customerRequest);
    CustomerDTO findCustomerById(long id);
    CustomerDTO save(CustomerDTO customerDTO);
    CustomerDTO deleteCustomer(Long id);
    ResponseDTO loadStaffs(Long id);
    void addStaffs(AssignmentCustomerDTO assignmentCustomerDTO);
    void setTransaction(UserDTO userDTO);
}
