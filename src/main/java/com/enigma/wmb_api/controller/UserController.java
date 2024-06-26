package com.enigma.wmb_api.controller;

import com.enigma.wmb_api.constant.APIUrl;
import com.enigma.wmb_api.constant.ResponseMessage;
import com.enigma.wmb_api.dto.request.user.PutUserRequest;
import com.enigma.wmb_api.dto.request.user.SearchUserRequest;
import com.enigma.wmb_api.dto.response.user.UserResponse;
import com.enigma.wmb_api.dto.response.common.CommonResponse;
import com.enigma.wmb_api.dto.response.common.CommonResponsePage;
import com.enigma.wmb_api.dto.response.common.PagingResponse;
import com.enigma.wmb_api.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping(path = APIUrl.USER_API)
public class UserController {
    private final UserService userService;

    // -- Create User from Register User Account --

    // Get All User Controller
    // Authorize
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'ADMIN')")
    @Operation(summary = "Private : Have Role Authorization", description = "Role : Superadmin and Admin")
    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<CommonResponsePage<List<UserResponse>>> getAllUser(
            @RequestParam(name = "name", required = false) String name,
            @RequestParam(name = "phoneNumber", required = false) String phoneNumber,
            @RequestParam(name = "page", defaultValue = "1") Integer page,
            @RequestParam(name = "size", defaultValue = "10") Integer size,
            @RequestParam(name = "sortBy", defaultValue = "status") String soryBy,
            @RequestParam(name = "direction", defaultValue = "desc") String direction
    ) {
        // Query Params & Pagination to SearchUserRequest
        SearchUserRequest searchUserRequest = SearchUserRequest.builder()
                .name(name)
                .phoneNumber(phoneNumber)
                .page(page)
                .size(size)
                .sortBy(soryBy)
                .direction(direction)
                .build();

        // Page All User Response from getAll Service
        Page<UserResponse> userResponses = userService.getAll(searchUserRequest);

        // Paging Response for Common Response
        PagingResponse pagingResponse = PagingResponse.builder()
                .totalPages(userResponses.getTotalPages())
                .totalElement(userResponses.getTotalElements())
                .page(userResponses.getPageable().getPageNumber() + 1)
                .size(userResponses.getPageable().getPageSize())
                .hasNext(userResponses.hasNext())
                .hasPrevious(userResponses.hasPrevious())
                .build();

        // Common Response
        CommonResponsePage<List<UserResponse>> response = CommonResponsePage.<List<UserResponse>>builder()
                .statusCode(HttpStatus.OK.value())
                .message(ResponseMessage.SUCCESS_GET_DATA)
                .data(userResponses.getContent())
                .paging(pagingResponse)
                .build();

        // Response Entity
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    // Get User by Id Controller
    // Authorize
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'ADMIN') or @userServiceImpl.hasAuthoritySelf(#id)")
    @Operation(summary = "Private : Have Role Authorization", description = "Role : Superadmin, Admin and Customer itself")
    @GetMapping(
            path = "/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<CommonResponse<UserResponse>> getUserById(
            @PathVariable String id
    ) {
        // User Response from getOneById service
        UserResponse userResponse = userService.getOneById(id);

        // Common Response
        CommonResponse<UserResponse> response = CommonResponse.<UserResponse>builder()
                .statusCode(HttpStatus.OK.value())
                .message(ResponseMessage.SUCCESS_GET_DATA)
                .data(userResponse)
                .build();

        // Response Entity
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    // Update Menu Controller
    // Authorize
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'ADMIN') or @userServiceImpl.hasAuthoritySelf(#putUserRequest)")
    @Operation(summary = "Private : Have Role Authorization", description = "Role : Superadmin, Admin and Customer itself")
    @PutMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<CommonResponse<UserResponse>> updateUser(
            @RequestBody PutUserRequest putUserRequest
    ) {
        // User Response from update Service
        UserResponse userResponse = userService.update(putUserRequest);

        // Common Response
        CommonResponse<UserResponse> userCommonResponse = CommonResponse.<UserResponse>builder()
                .statusCode(HttpStatus.CREATED.value())
                .message(ResponseMessage.SUCCESS_UPDATE_DATA)
                .data(userResponse)
                .build();

        // Response Entity
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(userCommonResponse);
    }

    // Delete User Controller
    // Authorize
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'ADMIN') or @userServiceImpl.hasAuthoritySelf(#id)")
    @Operation(summary = "Private : Have Role Authorization", description = "Role : Superadmin, Admin and Customer itself")
    @DeleteMapping(
            path = "/{id}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ResponseEntity<CommonResponse<UserResponse>> deleteUserById(
            @PathVariable String id
    ) {

        // User Response from delete Service
        userService.deleteById(id);

        // Common Response
        CommonResponse<UserResponse> userCommonResponse = CommonResponse.<UserResponse>builder()
                .statusCode(HttpStatus.OK.value())
                .message(ResponseMessage.SUCCESS_DELETE_DATA)
                .build();

        // Response Entity
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(userCommonResponse);
    }
}
