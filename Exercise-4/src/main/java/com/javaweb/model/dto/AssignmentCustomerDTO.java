package com.javaweb.model.dto;

import java.util.List;

public class AssignmentCustomerDTO {
    long customerId;
    List<Long> staffId;

    public long getCustomerId() {
        return customerId;
    }

    public List<Long> getStaffId() {
        return staffId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public void setStaffId(List<Long> staffId) {
        this.staffId = staffId;
    }
}
