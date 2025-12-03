package com.javaweb.repository.custom.impl;

import com.javaweb.builder.CustomerSearchRequest;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;


@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<CustomerEntity> findAllCustomers(CustomerSearchRequest customerSearchRequest, int page , int size) {
        List<CustomerEntity> customerEntityList = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT c.* " +
                " FROM customer c LEFT JOIN assignmentcustomer ac ON ac.customerid = c.id ");
        StringBuilder where = new StringBuilder(" WHERE  1 = 1 AND c.is_active = 1 ");
        if(customerSearchRequest.getStaffId() != null) where.append(" AND ac.staffid = "  +  customerSearchRequest.getStaffId() );
        if(customerSearchRequest.getName() != null && !customerSearchRequest.getName().equals("")) where.append(" AND c.fullname LIKE '%"+customerSearchRequest.getName()+"%'");
        if(customerSearchRequest.getEmail() != null && !customerSearchRequest.getEmail().equals("")) where.append(" AND c.email LIKE '%"+customerSearchRequest.getEmail()+"%'");
        if(customerSearchRequest.getCustomerPhone() != null && !customerSearchRequest.getCustomerPhone().equals("")) where.append(" AND c.phone LIKE '%"+customerSearchRequest.getCustomerPhone()+"%'");
        if(customerSearchRequest.getStatus() != null && !customerSearchRequest.getStatus().equals("")) where.append(" AND c.status LIKE '%"+customerSearchRequest.getCustomerPhone()+"%'");
        where.append(" GROUP BY c.id ");
        sql.append(where.toString());
        sql.append(" LIMIT " + size + " OFFSET " + (page * size));
        Query query = entityManager.createNativeQuery(sql.toString(),CustomerEntity.class);

        return query.getResultList();
    }

    @Override
    public Integer countCustomers(CustomerSearchRequest req) {
        StringBuilder sql = new StringBuilder(
                " SELECT COUNT(DISTINCT c.id) FROM customer c " +
                        " LEFT JOIN assignmentcustomer ac ON ac.customerid = c.id " +
                        " WHERE 1=1 AND c.is_active = 1 "
        );

        if (req.getName() != null) sql.append(" AND c.fullname LIKE '%" + req.getName() + "%'");
        if (req.getEmail() != null) sql.append(" AND c.email LIKE '%" + req.getEmail() + "%'");
        if (req.getCustomerPhone() != null) sql.append(" AND c.phone LIKE '%" + req.getCustomerPhone() + "%'");
        if (req.getStaffId() != null) sql.append(" AND ac.staffid = " + req.getStaffId());

        Query query = entityManager.createNativeQuery(sql.toString());
        return ((Number) query.getSingleResult()).intValue();
    }
}
