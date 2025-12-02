package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UserService;
import org.hibernate.annotations.common.reflection.XMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    UserService userService;

    @Autowired
    BuildingService buildingService;

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute("buildingSearchRequest") BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mdv = new ModelAndView("admin/building/list");

        // 1. SET MẶC ĐỊNH PAGE VÀ LIMIT (Quan trọng để không bị lỗi null khi mới vào)
        if (buildingSearchRequest.getPage() == 0) {
            buildingSearchRequest.setPage(1);
        }
        if (buildingSearchRequest.getLimit() == null) {
            buildingSearchRequest.setLimit(5); // Hiển thị 5 dòng/trang (bạn có thể sửa thành 10)
        }

        // 2. LOGIC PHÂN QUYỀN (Giữ nguyên)
        if (SecurityUtils.getAuthorities().contains("STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingSearchRequest.setStaffId(staffId);
        }

        // 3. GỌI SERVICE
        // Lưu ý: Kết quả trả về chứa danh sách tòa nhà, còn buildingSearchRequest sẽ được cập nhật totalPage bên trong service
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);

        // 4. SỬA LỖI TẠI ĐÂY: Phải đặt tên là "buildingSearchRequest" cho khớp với JSP
        mdv.addObject("buildingSearchRequest", buildingSearchRequest);
        mdv.addObject("buildingList", responseList);
        mdv.addObject("listStaffs", userService.getStaffs());
        mdv.addObject("districts", districtCode.type());
        mdv.addObject("buildingType", buildingType.type());
        return mdv;
    }
    @RequestMapping(value = "/admin/building-edit",method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mdv = new ModelAndView("admin/building/edit");


        mdv.addObject("districts", districtCode.type());
        mdv.addObject("buildingType", buildingType.type());
        mdv.addObject("building", buildingDTO);
        return mdv;
    }
    @RequestMapping(value = "/admin/building-edit-{id}",method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mdv = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO = buildingService.findById(id);
        if (buildingDTO.getTypeCode() != null) {
            List<String> typeList = buildingDTO.getTypeCode();
            buildingDTO.setTypeCode(typeList);
        }

        mdv.addObject("districts", districtCode.type());
        mdv.addObject("buildingType", buildingType.type());
        mdv.addObject("building", buildingDTO);
        return mdv;
    }


}
