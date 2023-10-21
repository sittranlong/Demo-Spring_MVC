package com.example.demo.controller;

import com.example.demo.entity.Hang;
import com.example.demo.entity.MayTinh;
import com.example.demo.service.HangService;
import com.example.demo.service.MayTinhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/may-tinh/")
public class MayTinhController {

    @Autowired
    MayTinhService mayTinhService;

    @Autowired
    HangService hangService;

    @GetMapping("hien-thi")
    public String hienThi(Model model, @RequestParam(name = "page", defaultValue="0") int page){
        Page<MayTinh> mayTinhPage = mayTinhService.getData(page);
        model.addAttribute("ListMayTinh", mayTinhPage);
        List<Hang> hangList = hangService.getAll();
        model.addAttribute("ListHang", hangList);
        return "index";
    }

    @PostMapping("add")
    public String add(
            @RequestParam(name = "ma") String ma,
            @RequestParam(name = "tenMayTinh") String tenMayTinh,
            @RequestParam(name = "gia") String gia,
            @RequestParam(name = "boNho") String boNho,
            @RequestParam(name = "mauSac") String mauSac,
            @RequestParam(name = "hang") String hang,
            @RequestParam(name = "mieuTa") String mieuTa
    ){
        MayTinh mayTinh = MayTinh.builder()
                .ma(ma)
                .tenMayTinh(tenMayTinh)
                .gia(Float.valueOf(gia))
                .boNho(boNho)
                .mauSac(mauSac)
                .hang(hangService.getOne(hang))
                .mieuTa(mieuTa)
                .build();

        mayTinhService.add(mayTinh);

        return "redirect:/may-tinh/hien-thi";
    }

    @GetMapping("detail/{id}")
    public String detail(Model model, @PathVariable(name = "id") String id){
        MayTinh mayTinh = mayTinhService.getOne(id);
        model.addAttribute("mayTinh", mayTinh);
        Page<MayTinh> mayTinhPage = mayTinhService.getData(0);
        model.addAttribute("ListMayTinh", mayTinhPage);
        List<Hang> hangList = hangService.getAll();
        model.addAttribute("ListHang", hangList);
        return "index";
    }

    @PostMapping("update")
    public String update(
            @RequestParam(name = "id") String id,
            @RequestParam(name = "ma") String ma,
            @RequestParam(name = "tenMayTinh") String tenMayTinh,
            @RequestParam(name = "gia") String gia,
            @RequestParam(name = "boNho") String boNho,
            @RequestParam(name = "mauSac") String mauSac,
            @RequestParam(name = "hang") String hang,
            @RequestParam(name = "mieuTa") String mieuTa
    ){
        MayTinh mayTinh = MayTinh.builder()
                .ma(ma)
                .tenMayTinh(tenMayTinh)
                .gia(Float.valueOf(gia))
                .boNho(boNho)
                .mauSac(mauSac)
                .hang(hangService.getOne(hang))
                .mieuTa(mieuTa)
                .build();

        mayTinhService.update(mayTinh, id);

        return "redirect:/may-tinh/hien-thi";
    }

    @GetMapping("remove/{id}")
    public String delete(@PathVariable(name = "id") String id){
        mayTinhService.delete(id);
        return "redirect:/may-tinh/hien-thi";
    }

    @GetMapping("view-update/{id}")
    public String viewUpdate(Model model, @PathVariable(name = "id") String id){
        MayTinh mayTinh = mayTinhService.getOne(id);
        model.addAttribute("mayTinh", mayTinh);
        List<Hang> hangList = hangService.getAll();
        model.addAttribute("ListHang", hangList);
        return "view-update";
    }

}
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

