package com.mvr.crud.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UsersRepository {

    private final JdbcTemplate jdbcTemplate;

    public UsersRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int save(String username, String email) {
        String sql = "INSERT INTO users(username, email) VALUES (?, ?)";
        return jdbcTemplate.update(sql, username, email);
    }

    public List<String> findAllUsernames() {
        String sql = "SELECT username FROM users";
        return jdbcTemplate.queryForList(sql, String.class);
    }

    public int deleteAll() {
        String sql = "DELETE FROM users WHERE 1=1";
        return jdbcTemplate.update(sql);
    }

}
