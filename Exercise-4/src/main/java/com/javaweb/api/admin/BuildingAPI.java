package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.custom.BuildingRepository;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")

@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;


    @PostMapping
    public void addOrUpdateBuilding(@ModelAttribute BuildingDTO buildingDTO) {
        buildingService.save(buildingDTO);
        System.out.println("addOrUpdateBuilding");
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody long[] ids) {
        buildingService.deleteByIdIn(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable long id) {
        ResponseDTO responseDTO = buildingService.loadStaffs(id);
        return responseDTO;
    }

    @PostMapping("/assignments")
    public void addStaffs(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        buildingService.addstaff(assignmentBuildingDTO);

    }
}
