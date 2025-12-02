package com.javaweb.model.request;


import com.javaweb.model.dto.AbstractDTO;

public class CustomerRequest extends AbstractDTO {
    private String customerPhone;
    private String name;
    private String email;
    private Long staffId;
    private String status;

    public String getCustomerPhone() {
        return customerPhone;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
