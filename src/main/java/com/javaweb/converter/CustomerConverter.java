package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class CustomerConverter {

    @Autowired
    private ModelMapper modelMapper;

    public CustomerDTO toCustomerDTO(CustomerEntity customerEntity) {
        CustomerDTO customerDTO = this.modelMapper.map(customerEntity, CustomerDTO.class);
        customerDTO.setCustomerPhone(customerEntity.getPhone());
        customerDTO.setName(customerEntity.getFullname());
        return customerDTO;
    }
}
