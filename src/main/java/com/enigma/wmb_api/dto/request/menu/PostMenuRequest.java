package com.enigma.wmb_api.dto.request.menu;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostMenuRequest {
    @NotNull(message = "name is required")
    @NotBlank(message = "name can't be blank")
    private String name;

    @NotNull(message = "price is required")
    @Min(value = 1, message = "price must be greater than 0")
    private Integer price;

    private MultipartFile image;
}
