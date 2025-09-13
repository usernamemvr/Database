package com.mvr.crudjpa.entity;

import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "user_new")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "username", nullable = false, unique = true)
    private String name;

    @Column(unique = true)
    private String email;

    private LocalDateTime createdAt = LocalDateTime.now();

    public User(String username, String email) {
        this.name = username;
        this.email = email;
        this.createdAt = LocalDateTime.now();
    }
}
