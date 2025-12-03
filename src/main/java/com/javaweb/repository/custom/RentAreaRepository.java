package com.javaweb.repository.custom;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity,Long> {
    void deleteBybuildingIdIn(long[] ids);
    RentAreaEntity save(RentAreaEntity rentArea);
}
