package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "customer")
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "is_active")
    private Integer is_active;

    @Column(name = "createddate")
    private String createddate;

    @Column(name = "demand")
    private String demand;

    @Column(name = "status")
    private String status;

    public String getDemand() {
        return demand;
    }

    public String getStatus() {
        return status;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateddate() {
        return createddate;
    }



    public void setCreateddate(String createddate) {}

    @OneToMany(mappedBy = "customers", fetch = FetchType.LAZY,cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<AssignmentCustomerEntity> assignmentCustomerEntities = new ArrayList<>();


    public String getFullname() {
        return fullname;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Integer getIs_active() {
        return is_active;
    }

    public List<AssignmentCustomerEntity> getAssignmentCustomerEntities() {
        return assignmentCustomerEntities;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIs_active(Integer is_active) {
        this.is_active = is_active;
    }

    public void setAssignmentCustomerEntities(List<AssignmentCustomerEntity> assignmentCustomerEntities) {
        this.assignmentCustomerEntities = assignmentCustomerEntities;
    }


}
