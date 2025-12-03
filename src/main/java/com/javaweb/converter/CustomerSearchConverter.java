package com.javaweb.converter;

import com.javaweb.builder.CustomerSearchRequest;
import com.javaweb.model.request.CustomerRequest;
import org.springframework.stereotype.Component;

@Component
public class CustomerSearchConverter {

    public CustomerSearchRequest toCustomerSearchRequest(CustomerRequest request) {
        CustomerSearchRequest result = new CustomerSearchRequest.Builder()
                .setName(request.getName())
                .setCustomerPhone(request.getCustomerPhone())
                .setEmail(request.getEmail())
                .setStaffId(request.getStaffId())
                .setStatus(request.getStatus())
                .build();

        return result;
    }
}