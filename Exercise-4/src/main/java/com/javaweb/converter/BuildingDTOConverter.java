package com.javaweb.converter;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = this.modelMapper.map(buildingEntity, BuildingDTO.class);
        List<String> list = new ArrayList<>();
        String[] a = buildingEntity.getType().split(",");
        for (String s : a) {
            list.add(s);
        }
        buildingDTO.setTypeCode(list);
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String areaResults = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(areaResults);
        return buildingDTO;
    }
}
