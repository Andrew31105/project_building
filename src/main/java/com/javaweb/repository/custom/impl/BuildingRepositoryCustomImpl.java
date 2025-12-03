package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static String joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql){
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            sql.append(" INNER JOIN rentarea ra ON b.id = ra.buildingid");
        }

        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ab ON b.id = ab.buildingid");
        }
        return sql.toString();
    }

    public static String normal_query(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where){
        try {
            Field[] fields = buildingSearchBuilder.getClass().getDeclaredFields();
            for(Field item : fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("areaFrom") &&
                        !fieldName.equals("areaTo") && !fieldName.equals("rentPriceFrom") && !fieldName.equals("typeCode")
                        && !fieldName.equals("rentPriceTo")){
                    Object fieldValue = item.get(buildingSearchBuilder);
                    if(fieldValue != null && !fieldValue.equals("")){
                        if(item.getType().equals(Long.class)){
                            where.append(" AND b." + fieldName + "= " + fieldValue);
                        }
                        else{
                            where.append(" AND b." + fieldName + " LIKE '%" + fieldValue + "%' ");
                        }
                    }
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return where.toString();
    }

    public static String special_query(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where){
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if(rentAreaFrom != null) {
            where.append(" AND ra.value >= " + rentAreaFrom);
        }
        if(rentAreaTo != null) {
            where.append(" AND ra.value <= " + rentAreaTo);
        }

        // 2. XỬ LÝ GIÁ THUÊ (Dùng bảng building - b) -> ĐÃ SỬA LỖI Ở ĐÂY
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();

        if(rentPriceFrom != null) {
            where.append(" AND b.rentprice >= " + rentPriceFrom);
        }
        if(rentPriceTo != null) {
            where.append(" AND b.rentprice <= " + rentPriceTo);
        }
        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if(typeCode != null && !typeCode.isEmpty()) {
            where.append(" AND (");
            List<String> likes = new ArrayList<>();
            for(String item : typeCode) {
                likes.add("b.type LIKE '%" + item + "%'");
            }
            where.append(String.join(" OR ", likes));
            where.append(")");
        }

        return where.toString();
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, int page, int size) {
        StringBuilder sql = new StringBuilder("select b.* from building b");
        joinTable(buildingSearchBuilder, sql);

        StringBuilder where = new StringBuilder(" WHERE 1 = 1");
        normal_query(buildingSearchBuilder, where);
        special_query(buildingSearchBuilder, where);
        where.append(" GROUP BY b.id");

        sql.append(where);
        sql.append(" LIMIT " + size + " OFFSET " + (page * size));

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    @Override
    public Integer countBuildings(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(DISTINCT b.id) from building b");
        joinTable(buildingSearchBuilder, sql);

        StringBuilder where = new StringBuilder(" WHERE 1 = 1");
        normal_query(buildingSearchBuilder, where);
        special_query(buildingSearchBuilder, where);

        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString());
        return ((Number) query.getSingleResult()).intValue();
    }
}