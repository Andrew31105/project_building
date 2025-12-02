package com.javaweb.config;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import static com.lowagie.text.Image.skip;

@Configuration
@ComponentScan(basePackages = "com.javaweb")
public class ModelMapperConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();

        // Dùng PropertyMap cho phiên bản cũ (thay vì Lambda)
        modelMapper.addMappings(new PropertyMap<BuildingDTO, BuildingEntity>() {
            @Override
            protected void configure() {
                // Cú pháp skip chuẩn cho version 0.7.x
                skip().setImages(null);
                skip().setAvatar(null);
            }
        });

        return modelMapper;
    }
}
