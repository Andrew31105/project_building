package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.converter.BuildingSearchResponeConverter;
import com.javaweb.entity.AssignmentBuildingEnity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.AssignmentRepository;
import com.javaweb.repository.custom.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.repository.custom.RentAreaRepository;
import com.javaweb.repository.custom.impl.BuildingRepositoryCustomImpl;
import com.javaweb.service.IBuilidingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;


@Service
public class BuildingService implements IBuilidingService {

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingSearchResponeConverter buildingSearchResponeConverter;

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingDTOConverter buildingDTOConverter;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UploadService uploadService;
    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingSearchResponse> listRespone = new ArrayList<>();
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        int page = buildingSearchRequest.getPage();
        int limit = buildingSearchRequest.getLimit();
        List<BuildingEntity> buildingEntityList = buildingRepository.findAll(buildingSearchBuilder,page - 1,limit);
        int totals = buildingRepository.countBuildings(buildingSearchBuilder);
        buildingSearchRequest.setTotalPage(((int) Math.ceil((double) totals / limit)));
        buildingSearchRequest.setTotalItems(totals);
        for(BuildingEntity item : buildingEntityList){
            BuildingSearchResponse building = new BuildingSearchResponse();
            building =  buildingSearchResponeConverter.toBuildingSearchResponse(item);
            listRespone.add(building);
        }
        return listRespone ;
    }

    @Override
    public BuildingDTO findById(long id) {
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO = buildingDTOConverter.toBuildingDTO(buildingRepository.findById(id));

        return buildingDTO;
    }

    @Override
    @Transactional
    public void deleteByIdIn(long[] ids) {
        assignmentRepository.deleteBybuildingsIdIn(ids);
        rentAreaRepository.deleteBybuildingIdIn(ids);
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    @Transactional
    public BuildingDTO save(BuildingDTO buildingDTO) {
        Long buildingId = buildingDTO.getId();
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);

        // 1. XỬ LÝ AVATAR
        if (buildingDTO.getImageFile() != null && !buildingDTO.getImageFile().isEmpty()) {
            String url = uploadService.uploadImage(buildingDTO.getImageFile());
            buildingEntity.setAvatar(url);
        } else if (buildingId != null) {
            BuildingEntity oldBuilding = buildingRepository.findById(buildingId).orElse(null);
            if (oldBuilding != null) {
                buildingEntity.setAvatar(oldBuilding.getAvatar());
            }
        }
        Set<String> allImageUrls = new LinkedHashSet<>();
        String oldImagesStr = buildingDTO.getImages();
        if (oldImagesStr != null && !oldImagesStr.trim().isEmpty()) {
            String[] oldImagesArray = oldImagesStr.split(",");
            for (String img : oldImagesArray) {
                String trimmed = img.trim();
                if (!trimmed.isEmpty()) {
                    allImageUrls.add(trimmed);
                }
            }
        }
        List<MultipartFile> newFiles = buildingDTO.getImageFiles();
        if (newFiles != null && !newFiles.isEmpty()) {
            for (MultipartFile file : newFiles) {
                if (!file.isEmpty()) {
                    String newUrl = uploadService.uploadImage(file);
                    if (newUrl != null) {
                        allImageUrls.add(newUrl);
                    }
                }
            }
        }
        if (!allImageUrls.isEmpty()) {
            buildingEntity.setImages(String.join(",", allImageUrls));
        } else {
            buildingEntity.setImages("");
        }
        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
            String[] areaArray = buildingDTO.getRentArea().split(",");
            List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
            for (String str : areaArray) {
                RentAreaEntity rentArea = new RentAreaEntity();
                rentArea.setValue(str.trim());
                rentArea.setBuilding(buildingEntity);
                rentAreaEntities.add(rentArea);
            }
            buildingEntity.setRentAreaEntities(rentAreaEntities);
        }

        buildingEntity = buildingRepository.save(buildingEntity);
        return buildingDTOConverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public ResponseDTO loadStaffs(long buildingId) {
        ResponseDTO responseDTO = new ResponseDTO();
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId);
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<AssignmentBuildingEnity> staffAssignments = buildingEntity.getAssignmentBuildingEnities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        List<UserEntity> staffs1 = new ArrayList<>();
        for(AssignmentBuildingEnity staff : staffAssignments){
            UserEntity userEntity = new UserEntity();
            userEntity = staff.getStaffs();
            staffs1.add(userEntity);
        }
        for(UserEntity userEntity : staffs){
                StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
                staffResponseDTO.setStaffId(userEntity.getId());
                staffResponseDTO.setFullName(userEntity.getFullName());
                if(staffs1.contains(userEntity)){
                    staffResponseDTO.setChecked("checked");
                }
                else{
                    staffResponseDTO.setChecked("");
                }
                staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    @Transactional
    public void addstaff(AssignmentBuildingDTO assignmentBuildingDTO) {

        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        buildingEntity.getAssignmentBuildingEnities().clear();
        for(long x : assignmentBuildingDTO.getStaffs()){

            UserEntity userEntity = userRepository.findById(x).get();
            AssignmentBuildingEnity assignmentBuildingEnity = new AssignmentBuildingEnity();
            assignmentBuildingEnity.setStaffs(userEntity);
            assignmentBuildingEnity.setBuildings(buildingEntity);
            buildingEntity.getAssignmentBuildingEnities().add(assignmentBuildingEnity);
        }
        buildingRepository.save(buildingEntity);
    }



}
