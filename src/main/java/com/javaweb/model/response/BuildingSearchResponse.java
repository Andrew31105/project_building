package com.javaweb.model.response;


import com.javaweb.model.dto.AbstractDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class BuildingSearchResponse {
	private Long id;
	private String name;
	private String address;
	private Long numberOfBasement;
	private String managerName;
	private String managerPhone;
	private Long floorArea;
	private String rentArea;
    private String emptyArea;
    private Long rentPrice;
    private String serviceFee;
    private Double brokerageFee;
    private String imageName;
    private String images;
    private List<MultipartFile> imageFiles;
    private String avatar;
    private String district;
    private String direction;
    private String level;
    private Integer limit = 3;
    private int maxPageItems;
    private int page;
    private int totalItems;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getManagerName() {
		return managerName;
	}
	public String getRentArea() {
		return rentArea;
	}
	public void setRentArea(String rentArea) {
		this.rentArea = rentArea;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPhoneNumber() {
		return managerPhone;
	}
	public void setManagerPhoneNumber(String managerPhoneNumber) {
		this.managerPhone = managerPhoneNumber;
	}
	public Long getFloorArea() {
		return floorArea;
	}
	public void setFloorArea(Long floorArea) {
		this.floorArea = floorArea;
	}
	public String getEmptyArea() {
		return emptyArea;
	}
	public void setEmptyArea(String emptyArea) {
		this.emptyArea = emptyArea;
	}
	public Long getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(Long rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getServiceFee() {
		return serviceFee;
	}
	public void setServiceFee(String serviceFee) {
		this.serviceFee = serviceFee;
	}
	public Double getBrokerageFee() {
		return brokerageFee;
	}
	public void setBrokerageFee(Double brokerageFee) {
		this.brokerageFee = brokerageFee;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Long getNumberOfBasement() {
		return numberOfBasement;
	}

	public void setNumberOfBasement(Long numberOfBasement) {
		this.numberOfBasement = numberOfBasement;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

    public String getImageName() {
        return imageName;
    }

    public String getImages() {
        return images;
    }

    public List<MultipartFile> getImageFiles() {
        return imageFiles;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public void setImageFiles(List<MultipartFile> imageFiles) {
        this.imageFiles = imageFiles;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDirection() {
        return direction;
    }

    public String getLevel() {
        return level;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Integer getLimit() {
        return limit;
    }

    public int getMaxPageItems() {
        return maxPageItems;
    }

    public int getPage() {
        return page;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public void setMaxPageItems(int maxPageItems) {
        this.maxPageItems = maxPageItems;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }
}
