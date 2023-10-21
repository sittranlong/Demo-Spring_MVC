package com.example.demo.service;

import com.example.demo.entity.Hang;

import java.util.List;

public interface HangService {
    List<Hang> getAll();

    Hang getOne(String id);


}
