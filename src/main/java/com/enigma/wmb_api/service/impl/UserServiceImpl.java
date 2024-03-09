package com.enigma.wmb_api.service.impl;

import com.enigma.wmb_api.constant.ResponseMessage;
import com.enigma.wmb_api.dto.request.user.PutUserRequest;
import com.enigma.wmb_api.dto.request.user.SearchUserRequest;
import com.enigma.wmb_api.dto.response.UserResponse;
import com.enigma.wmb_api.entity.User;
import com.enigma.wmb_api.repositry.UserRepository;
import com.enigma.wmb_api.service.UserService;
import com.enigma.wmb_api.specification.UserSpecification;
import com.enigma.wmb_api.util.ValidationUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final ValidationUtil validationUtil;

    // -- Create User from Register User Account --
    @Transactional(rollbackFor = Exception.class)
    @Override
    public User create(User user) {
        // Save to Repository
        return userRepository.saveAndFlush(user);
    }

    // Get All User Service
    @Transactional(readOnly = true)
    @Override
    public Page<UserResponse> getAll(SearchUserRequest searchUserRequest) {
        // Validate Page
        if (searchUserRequest.getPage() <=0) searchUserRequest.setPage(1);
        // Sort
        Sort sort = Sort.by(Sort.Direction.fromString(searchUserRequest.getDirection()), searchUserRequest.getSortBy());
        // Pageable
        Pageable pageable = PageRequest.of(searchUserRequest.getPage() - 1, searchUserRequest.getSize(), sort);
        // Specification
        Specification<User> specification = UserSpecification.getSpecification(searchUserRequest);

        // Find All User with Pageable
        Page<User> userPages = userRepository.findAll(specification, pageable);

        // Response Page
        // Convert to User Response
        return userPages.map(this::convertToUserResponse);
    }

    // Get User By Id Service (return userResponse)
    @Transactional(readOnly = true)
    @Override
    public UserResponse getOneById(String id) {
        // Find by Id
        User user = findByIdOrThrowNotFound(id);

        // Convert to User Response
        return convertToUserResponse(user);
    }

    // Get User By Id Service (return user)
    @Transactional(readOnly = true)
    @Override
    public User getById(String id) {
        // Find By id (return entity)
        return findByIdOrThrowNotFound(id);
    }

    // Update User Service
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UserResponse update(PutUserRequest putUserRequest) {
        // Validate putUserRequest
        validationUtil.validate(putUserRequest);

        // Get by Id
        User currentUser = getById(putUserRequest.getId());

        // Create User
        User user = User.builder()
                .id(currentUser.getId())
                .name(putUserRequest.getName())
                .phoneNumber(putUserRequest.getPhoneNumber())
                .build();

        // Save to Repository
        userRepository.saveAndFlush(user);

        // Convert to User Response
        return convertToUserResponse(user);
    }

    // Delete User Service
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteById(String id) {
        // Get by Id
        User user = getById(id);
        
        // Delete to Repository
        userRepository.delete(user);
    }

    // Find User or Throw Error Service
    @Transactional(readOnly = true)
    public User findByIdOrThrowNotFound(String id){
        return userRepository.findById(id).orElseThrow(() ->
                new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        ResponseMessage.ERROR_NOT_FOUND
                )
        );
    }

    // Convert to Response User Service
    public UserResponse convertToUserResponse(User user) {
        return UserResponse.builder()
                .id(user.getId())
                .name(user.getName())
                .phoneNumber(user.getPhoneNumber())
                .build();
    }
}
