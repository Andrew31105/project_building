package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController()
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private CustomerService customerService;



    @PostMapping
    public CustomerDTO addCustomer(@RequestBody CustomerDTO customerDTO){
        return customerService.save(customerDTO);
    }

    @DeleteMapping
    public CustomerDTO deleteCustomer(@RequestBody Long[] id){
        for(Long id1 : id){
            customerService.deleteCustomer(id1);
        }
        return null;
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO responseDTO = customerService.loadStaffs(id);

        return  responseDTO;
    }

    @PostMapping("/assignments")
    public void addStaffs(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.addStaffs(assignmentCustomerDTO);
    }

    @PostMapping("/transaction")
    public void stransaction(@RequestBody UserDTO userDTO) {
        customerService.setTransaction(userDTO);
    }
}
