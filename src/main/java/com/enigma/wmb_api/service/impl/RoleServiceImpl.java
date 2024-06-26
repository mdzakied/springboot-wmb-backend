package com.enigma.wmb_api.service.impl;

import com.enigma.wmb_api.constant.UserRoleEnum;
import com.enigma.wmb_api.entity.Role;
import com.enigma.wmb_api.repositry.RoleRepository;
import com.enigma.wmb_api.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Role getOrSave(UserRoleEnum role) {
        return roleRepository.findByRole(role)
                .orElseGet(() -> roleRepository.saveAndFlush(Role.builder().role(role).build()));

    }
}
