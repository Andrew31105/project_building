package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = this.modelMapper.map(buildingDTO, BuildingEntity.class);

        if (buildingDTO.getTypeCode() != null && !buildingDTO.getTypeCode().isEmpty()) {
            StringBuilder a = new StringBuilder();
            for(String s : buildingDTO.getTypeCode()) {
                a.append(s);
                a.append(",");
            }

            buildingEntity.setType(a.toString().substring(0, a.toString().length() - 1));
        }

        return buildingEntity;
    }

}
