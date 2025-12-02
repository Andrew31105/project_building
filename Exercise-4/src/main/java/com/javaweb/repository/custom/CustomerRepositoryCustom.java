package com.javaweb.repository.custom;

import com.javaweb.builder.CustomerSearchRequest;
import com.javaweb.entity.CustomerEntity;

import java.util.List;

public interface CustomerRepositoryCustom {

    public List<CustomerEntity> findAllCustomers(CustomerSearchRequest customerSearchRequest, int page, int size);
    Integer countCustomers(CustomerSearchRequest customerSearchRequest);
}
