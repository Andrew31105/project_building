package com.javaweb.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
public class BuildingEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;

    @Column(name = "street")
    private String street;

    @Column(name = "ward")
    private String ward;

    @Column(name = "district")
    private String district;

    @Column(name = "structure")
    private String structure;

    @Column(name = "numberofbasement")
    private Integer numberOfBasement;

    @Column(name = "floorarea")
    private Integer floorArea;

    @Column(name = "direction")
    private String direction;

    @Column(name = "level")
    private String level;

    @Column(name = "rentprice")
    private Integer rentPrice;

    @Column(name = "rentpricedescription", columnDefinition = "TEXT")
    private String rentPriceDescription;

    @Column(name = "servicefee")
    private String serviceFee;

    @Column(name = "carfee")
    private String carFee;

    @Column(name = "motofee")
    private String motoFee;

    @Column(name = "overtimefee")
    private String overtimeFee;

    @Column(name = "waterfee")
    private String waterFee;

    @Column(name = "electricityfee")
    private String electricityFee;

    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;

    @Column(name = "brokeragefee")
    private BigDecimal brokerageFee;

    @Column(name = "type")
    private String type;

    @Column(name = "note")
    private String note;

    @Column(name = "linkofbuilding")
    private String linkOfBuilding;

    @Column(name = "map")
    private String map;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;

    @Column(name = "images") // Tên cột bạn vừa tạo
    private String images;

    @OneToMany(mappedBy = "buildings",fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<AssignmentBuildingEnity> assignmentBuildingEnities = new ArrayList<>();

    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY,cascade = { CascadeType.PERSIST, CascadeType.MERGE }, orphanRemoval = true)
    private List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

    public List<RentAreaEntity> getRentAreaEntities() {
        return rentAreaEntities;
    }
    public void setRentAreaEntities(List<RentAreaEntity> rentAreaEntities) {}

    public List<AssignmentBuildingEnity> getAssignmentBuildingEnities() {
        return assignmentBuildingEnities;
    }

    public void setAssignmentBuildingEnities(List<AssignmentBuildingEnity> assignmentBuildingEnities) {
        this.assignmentBuildingEnities = assignmentBuildingEnities;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    // Getters and Setters

    public String getName() {
        return name;
    }

    public String getStreet() {
        return street;
    }

    public String getWard() {
        return ward;
    }

    public String getDistrict() {
        return district;
    }

    public String getStructure() {
        return structure;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public String getDirection() {
        return direction;
    }

    public String getLevel() {
        return level;
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public String getRentPriceDescription() {
        return rentPriceDescription;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public String getCarFee() {
        return carFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public String getOvertimeFee() {
        return overtimeFee;
    }

    public String getWaterFee() {
        return waterFee;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public String getDeposit() {
        return deposit;
    }

    public String getPayment() {
        return payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public String getDecorationTime() {
        return decorationTime;
    }

    public BigDecimal getBrokerageFee() {
        return brokerageFee;
    }

    public String getType() {
        return type;
    }

    public String getNote() {
        return note;
    }

    public String getLinkOfBuilding() {
        return linkOfBuilding;
    }

    public String getMap() {
        return map;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public void setNumberOfBasement(Integer numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public void setRentPriceDescription(String rentPriceDescription) {
        this.rentPriceDescription = rentPriceDescription;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public void setCarFee(String carFee) {
        this.carFee = carFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public void setOvertimeFee(String overtimeFee) {
        this.overtimeFee = overtimeFee;
    }

    public void setWaterFee(String waterFee) {
        this.waterFee = waterFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public void setDecorationTime(String decorationTime) {
        this.decorationTime = decorationTime;
    }

    public void setBrokerageFee(BigDecimal brokerageFee) {
        this.brokerageFee = brokerageFee;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setLinkOfBuilding(String linkOfBuilding) {
        this.linkOfBuilding = linkOfBuilding;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}