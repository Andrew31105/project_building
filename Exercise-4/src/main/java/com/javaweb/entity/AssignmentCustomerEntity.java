package com.javaweb.entity;


import javax.persistence.*;

@Entity
@Table(name = "assignmentcustomer")
public class AssignmentCustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity staffs;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customers;

    public Long getId() {
        return id;
    }

    public UserEntity getStaffs() {
        return staffs;
    }

    public CustomerEntity getCustomers() {
        return customers;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setStaffs(UserEntity staffs) {
        this.staffs = staffs;
    }

    public void setCustomers(CustomerEntity customers) {
        this.customers = customers;
    }
}
