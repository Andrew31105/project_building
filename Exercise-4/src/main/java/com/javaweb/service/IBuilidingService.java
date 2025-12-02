package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface IBuilidingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findById(long id);
    void deleteByIdIn(long[] ids);
    BuildingDTO save(BuildingDTO building);
    ResponseDTO loadStaffs(long id);
    void addstaff(AssignmentBuildingDTO assignmentBuildingDTO);

}
