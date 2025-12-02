package com.javaweb.builder;

public class CustomerSearchRequest {

    private String name;
    private String customerPhone;
    private String email;
    private Long staffId;
    private String status;

    public CustomerSearchRequest() {
    }

    private CustomerSearchRequest(Builder builder) {
        this.name = builder.name;
        this.customerPhone = builder.customerPhone;
        this.email = builder.email;
        this.staffId = builder.staffId;
        this.status = builder.status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }

    // --- ĐÃ BỔ SUNG GETTER CHO STATUS (QUAN TRỌNG) ---
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // --- INNER CLASS BUILDER ---
    public static class Builder {
        private String name;
        private String customerPhone;
        private String email;
        private Long staffId;
        private String status;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setCustomerPhone(String customerPhone) {
            this.customerPhone = customerPhone;
            return this;
        }

        public Builder setEmail(String email) {
            this.email = email;
            return this;
        }

        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setStatus(String status) {
            this.status = status;
            return this;
        }

        public CustomerSearchRequest build() {
            return new CustomerSearchRequest(this);
        }
    }
}