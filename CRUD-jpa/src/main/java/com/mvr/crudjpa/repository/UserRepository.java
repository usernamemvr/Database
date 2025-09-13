package com.mvr.crudjpa.repository;

import com.mvr.crudjpa.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
