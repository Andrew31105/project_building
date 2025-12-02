    package com.javaweb.service.impl;


    import com.javaweb.builder.CustomerSearchRequest;
    import com.javaweb.converter.CustomerConverter;
    import com.javaweb.converter.CustomerCoverterE;
    import com.javaweb.converter.CustomerSearchConverter;
    import com.javaweb.entity.AssignmentCustomerEntity;
    import com.javaweb.entity.CustomerEntity;
    import com.javaweb.entity.UserEntity;
    import com.javaweb.model.dto.AssignmentCustomerDTO;
    import com.javaweb.model.dto.CustomerDTO;
    import com.javaweb.model.dto.UserDTO;
    import com.javaweb.model.request.BuildingSearchRequest;
    import com.javaweb.model.request.CustomerRequest;
    import com.javaweb.model.response.ResponseDTO;
    import com.javaweb.model.response.StaffResponseDTO;
    import com.javaweb.repository.CustomerRepository;
    import com.javaweb.repository.UserRepository;
    import com.javaweb.service.ICustomerService;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.ArrayList;
    import java.util.Collections;
    import java.util.List;

    @Service
    public class CustomerService implements ICustomerService {

        @Autowired
        private CustomerRepository customerRepository;

        @Autowired
        private CustomerSearchConverter customerSearchConverter;

        @Autowired
        private CustomerConverter customerConverter;

        @Autowired
        private CustomerCoverterE customerConverterE;

        @Autowired
        private UserRepository userRepository;

        @Override
        public List<CustomerDTO> findAllCustomers(CustomerRequest customerRequest) {
            List<CustomerDTO> customerDTOList = new ArrayList<>();
            CustomerSearchRequest customerSearchRequest = new CustomerSearchRequest();
            customerSearchRequest = customerSearchConverter.toCustomerSearchRequest(customerRequest);

            int page = customerRequest.getPage();
            int limit = customerRequest.getLimit();

            List<CustomerEntity> customerEntities =   customerRepository.findAllCustomers(customerSearchRequest, page - 1 , limit);
            int totals = customerRepository.countCustomers(customerSearchRequest);
            customerRequest.setTotalPage(((int) Math.ceil((double) totals / limit)));
            customerRequest.setTotalItems(totals);
            for(CustomerEntity x : customerEntities) {
                customerDTOList.add( customerConverter.toCustomerDTO(x));
            }
            return customerDTOList;
        }

        @Override
        public CustomerDTO findCustomerById(long id) {
            CustomerDTO customerDTO = customerConverter.toCustomerDTO(customerRepository.findById(id));
            return customerDTO;
        }

        @Override
        public CustomerDTO save(CustomerDTO customerDTO) {
            CustomerEntity customerEntity = customerConverterE.toCustomerEntity(customerDTO);
            customerEntity = customerRepository.save(customerEntity);
            return customerConverter.toCustomerDTO(customerEntity);
        }

        @Override
        public CustomerDTO deleteCustomer(Long id) {
            CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
            customerEntity.setIs_active(0);
            customerEntity = customerRepository.save(customerEntity);
            return customerConverter.toCustomerDTO(customerEntity);
        }

        @Override
        public ResponseDTO loadStaffs(Long id) {
            ResponseDTO responseDTO = new ResponseDTO();
            CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
            List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
            List<AssignmentCustomerEntity> staffAssignments = customerEntity.getAssignmentCustomerEntities();
            List<StaffResponseDTO>  staffResponseDTOList = new ArrayList<>();
            List<UserEntity> staffs1 = new ArrayList<>();

            for(AssignmentCustomerEntity staff : staffAssignments){
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
                staffResponseDTOList.add(staffResponseDTO);
            }
            responseDTO.setData(staffResponseDTOList);
            responseDTO.setMessage("success");
            return responseDTO;

        }


        @Override
        public void addStaffs(AssignmentCustomerDTO assignmentCustomerDTO) {

            CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId());
            customerEntity.getAssignmentCustomerEntities().clear();
            for(long x :  assignmentCustomerDTO.getStaffId()){
                UserEntity userEntity = userRepository.findById(x).get();
                AssignmentCustomerEntity assignmentCustomerEntity = new AssignmentCustomerEntity();
                assignmentCustomerEntity.setStaffs(userEntity);
                assignmentCustomerEntity.setCustomers(customerEntity);
                customerEntity.getAssignmentCustomerEntities().add(assignmentCustomerEntity);
            }
            customerRepository.save(customerEntity);
        }

        @Override
        public void setTransaction(UserDTO userDTO) {
            UserEntity  userEntity = userRepository.findOneByUserName(userDTO.getUserName());
            CustomerEntity customerEntity = customerRepository.findByFullnameContaining(userEntity.getFullName());
            customerEntity.setStatus("CHUA_XU_LY");
            customerRepository.save(customerEntity);
        }
    }
