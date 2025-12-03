package com.javaweb.entity;


import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "value")
    private String value;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity building;

    public Long getId() {
        return id;
    }

    public String getValue() {
        return value;
    }

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
    }
}
