package com.example.demo.service.impl;

import com.example.demo.entity.Hang;
import com.example.demo.repository.HangRepository;
import com.example.demo.service.HangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HangServiceImpl implements HangService {

    @Autowired
    HangRepository hangRepository;

    @Override
    public List<Hang> getAll() {
        return hangRepository.findAll();
    }

    @Override
    public Hang getOne(String id) {
        return hangRepository.findById(UUID.fromString(id)).orElse(null);
    }
}
