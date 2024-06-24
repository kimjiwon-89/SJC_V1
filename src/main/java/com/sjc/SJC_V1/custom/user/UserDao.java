package com.sjc.SJC_V1.custom.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sjc.SJC_V1.model.Users;

@Repository
public interface UserDao extends JpaRepository<Users, Long> {
}