package com.javaweb.repository.custom;

import com.javaweb.entity.AssignmentBuildingEnity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentRepository extends JpaRepository<AssignmentBuildingEnity,Long> {
    void deleteBybuildingsIdIn(long[] ids);
    void save(List<AssignmentBuildingEnity> assignmentBuildingEnities);
}
