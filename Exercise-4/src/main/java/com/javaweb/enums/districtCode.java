package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public enum  districtCode {
    QUAN_1 ("Quận Đống Đa"),
    QUAN_2 ("Quận Thanh Xuân"),
    QUAN_3 ("Quận Nam Từ Niêm"),
    QUAN_4 ("Quận Bắc Từ Niêm"),
    QUAN_5 ("Quận Hoài Đức"),
    QUAN_6 ("Xã Gia Bình"),
    QUAN_7 ("Quận Gò Vấp"),
    QUAN_8 ("Quận Đức Anh"),
    ;

    private final String districtName;
    districtCode(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for(districtCode item : districtCode.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
