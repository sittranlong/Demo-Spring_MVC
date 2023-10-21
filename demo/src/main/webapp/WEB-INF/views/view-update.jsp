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
<h1>UpdateMayTinh</h1>
<main>
    <section>
        <form action="/may-tinh/update?id=${mayTinh.id}" method="post" class="container">
            Mã: <input type="text" name="ma" value="${mayTinh.ma}"> <br>
            Tên: <input type="text" name="tenMayTinh" value="${mayTinh.tenMayTinh}"> <br>
            Giá: <input type="text" name="gia" value="${mayTinh.gia}"> <br>
            Bộ nhớ: <input type="text" name="boNho" value="${mayTinh.boNho}"> <br>
            Màu sắc:
            <input type="radio" name="mauSac" value="Đen" ${mayTinh.mauSac=="Black" ? "checked" : ""} checked> Đen
            <input type="radio" name="mauSac" value="Bạc" ${mayTinh.mauSac=="Gray" ? "checked" : ""} > Bạc
            <br>
            Hãng:
            <select name="hang">
                <c:forEach items="${ListHang}" var="hang">
                    <option value="${hang.id}" ${mayTinh.hang.id==hang.id ? "selected" : ""} > ${hang.tenHang}</option>
                </c:forEach>
            </select>
            <br>
            Miêu tả: <input type="text" name="mieuTa" value="${mayTinh.mieuTa}"><br>
            <button class="btn btn-success" type="submit">Update</button>
        </form>
    </section>
</main>

</body>
</html>