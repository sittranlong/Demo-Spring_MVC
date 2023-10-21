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