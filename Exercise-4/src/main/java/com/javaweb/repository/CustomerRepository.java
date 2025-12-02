package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends CustomerRepositoryCustom, JpaRepository<CustomerEntity, Long> {
     CustomerEntity findById(long id);
     CustomerEntity save(CustomerEntity customerEntity);
    CustomerEntity findByFullnameContaining(String fullname);
}
