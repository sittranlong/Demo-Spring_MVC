package com.example.demo.service;

import com.example.demo.entity.MayTinh;
import org.springframework.data.domain.Page;

public interface MayTinhService {
    Page<MayTinh> getData(int page);
    void add(MayTinh mayTinh);
    MayTinh getOne(String id);
    void update(MayTinh mayTinh, String id);
    void delete(String id);
}
