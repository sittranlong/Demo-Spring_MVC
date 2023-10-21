package com.example.demo.service.impl;

import com.example.demo.entity.MayTinh;
import com.example.demo.repository.MayTinhRepository;
import com.example.demo.service.MayTinhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class MayTinhServiceImpl implements MayTinhService {

    @Autowired
    MayTinhRepository mayTinhRepository;

    @Override
    public Page<MayTinh> getData(int page) {
        Pageable pageable = PageRequest.of(page, 5);
        return mayTinhRepository.findAll(pageable);
    }

    @Override
    public void add(MayTinh mayTinh) {
        mayTinhRepository.save(mayTinh);
    }

    @Override
    public MayTinh getOne(String id) {
        return mayTinhRepository.findById(UUID.fromString(id)).orElse(null);
    }

    @Override
    public void update(MayTinh mayTinh, String id) {
        mayTinh.setId(UUID.fromString(id));
        mayTinhRepository.save(mayTinh);
    }

    @Override
    public void delete(String id) {
        mayTinhRepository.deleteById(UUID.fromString(id));
    }
}
