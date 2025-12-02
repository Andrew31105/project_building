package com.javaweb.converter;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponeConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item) {
        BuildingSearchResponse building = new BuildingSearchResponse();
        building = modelMapper.map(item, BuildingSearchResponse.class);
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        String districtName = new String();
        Map<String,String> ditricts = DistrictCode.type();
        if(item.getDistrict() != null && !item.getDistrict().isEmpty()){
            try {

                 districtName = ditricts.get(item.getDistrict());
            }
            catch (IllegalArgumentException e) {

            }
        }


        building.setAddress(item.getStreet() + "," + item.getWard() +"," + districtName);
        String areaResults = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        building.setRentArea(areaResults);
        return building;
    }

}
