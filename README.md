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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MayTinh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
<h1>MayTinh</h1>
<main>
    <section>
        <form action="/may-tinh/add" method="post" class="container">
            Mã: <input type="text" name="ma" value="${mayTinh.ma}"> <br>
            Tên: <input type="text" name="tenMayTinh" value="${mayTinh.tenMayTinh}"> <br>
            Giá: <input type="text" name="gia" value="${mayTinh.gia}"> <br>
            Bộ nhớ: <input type="text" name="boNho" value="${mayTinh.boNho}"> <br>
            Màu sắc:
            <input type="radio" name="mauSac" value="Đen" ${mayTinh.mauSac=="Đen" ? "checked" : ""} checked> Đen
            <input type="radio" name="mauSac" value="Bạc" ${mayTinh.mauSac=="Bạc" ? "checked" : ""} > Bạc
            <br>
            Hãng:
            <select name="hang">
                <c:forEach items="${ListHang}" var="hang">
                    <option value="${hang.id}" ${mayTinh.hang.id==hang.id ? "selected" : ""} >
                            ${hang.tenHang}
                    </option>
                </c:forEach>
            </select>
            <br>
            Miêu tả: <input type="text" name="mieuTa" value="${mayTinh.mieuTa}"><br>
            <button class="btn btn-success" type="submit">
                Add
            </button>
        </form>
    </section>
    <section>
        <div class="container">
            <table>
                <thead>
                <tr>
                    <th scope="col">Mã</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Bộ nhớ</th>
                    <th scope="col">Màu sắc</th>
                    <th scope="col">Tên hãng</th>
                    <th scope="col">Miêu tả</th>
                    <th scope="col">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ListMayTinh.content}" var="mayTinh">
                    <tr>
                        <td>${mayTinh.ma}</td>
                        <td>${mayTinh.tenMayTinh}</td>
                        <td>${mayTinh.gia}</td>
                        <td>${mayTinh.boNho}</td>
                        <td>${mayTinh.mauSac}</td>
                        <td>${mayTinh.hang.tenHang}</td>
                        <td>${mayTinh.mieuTa}</td>
                        <td>
                            <a href="/may-tinh/view-update/${mayTinh.id}" type="button" class="btn btn-secondary">
                                Update
                            </a>
                            <a href="/may-tinh/remove/${mayTinh.id}" type="button" class="btn btn-danger">
                                Remove
                            </a>
                            <a href="/may-tinh/detail/${mayTinh.id}" type="button" class="btn btn-success">
                                Detail
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="0" end="${ListMayTinh.totalPages -1}" varStatus="loop">
                        <li class="page-item">
                            <a class="page-link" href="/may-tinh/hien-thi?page=${loop.index}">
                                    ${loop.index +1}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </section>
</main>
</body>
</html>
