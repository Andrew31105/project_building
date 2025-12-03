package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerCoverterE {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        customerEntity.setId(customerDTO.getId());
        customerEntity.setPhone(customerDTO.getCustomerPhone());
        customerEntity.setFullname(customerDTO.getName());
        customerEntity.setIs_active(1);
        return customerEntity;
    }
}
