package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.builder.CustomerSearchRequest;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;

import java.util.List;

public interface BuildingRepositoryCustom {

    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, int page, int size);
    public Integer countBuildings(BuildingSearchBuilder buildingSearchBuilder);
}
