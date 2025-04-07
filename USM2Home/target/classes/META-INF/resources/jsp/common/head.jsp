<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="author" content="Drizvato"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>USM2Home:Find your home near USM!</title>

    <!-- Custom CSS -->
    <link href="/assets/css/styles.css?v=20210423" rel="stylesheet">
    <link href="/assets/css/message.css" rel="stylesheet">

    <!-- Custom Color Option -->
    <link href="/assets/css/colors.css" rel="stylesheet">

</head>

<body class="yellow-skin">

<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader"></div>

<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">

    <!-- ============================================================== -->
    <!-- Top header  -->
    <!-- ============================================================== -->
    <!-- Start Navigation -->
    <div class="header header-light dark-text">
        <div class="container">
            <nav id="navigation" class="navigation navigation-landscape">
                <div class="nav-header">
                    <a class="nav-brand" href="/">
<%--                        <img src="/assets/img/logo.png" class="logo" alt=""/>--%>
                        USM2Home
                    </a>
                    <div class="nav-toggle"></div>
                </div>
                <div class="nav-menus-wrapper" style="transition-property: none;">
                    <ul class="nav-menu">

                        <li><a href="/" style="font-size: 15px;">Home</a></li>
                        <li><a href="/house?rentType=whole" style="font-size: 15px;">Whole Rent</a></li>
                        <li><a href="/house?rentType=share" style="font-size: 15px;">Share Rent</a></li>
                        <li><a href="/post" style="font-size: 15px;">Post a Rent</a></li>
                        <li><a href="/news" style="font-size: 15px;">Explore</a></li>
<%--                        <c:if test="${sessionScope.user != null}">--%>
<%--                            <li><a href="/message" style="font-size: 15px;">Unread Messages--%>
<%--                                <span style="color: red;">(${sessionScope.user.notReadMessageCount})</span>--%>
<%--                            </a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>

                    </ul>

                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <ul class="nav-menu nav-menu-social align-to-right dhsbrd">

                                <li>
                                    <a href="#" data-toggle="modal" id="gotoLogin" data-target="#login"
                                       class="text-blue">
                                        <i class="fas fa-user-circle mr-1"></i><span class="dn-lg">Login</span>
                                    </a>
                                </li>
                                <li class="add-listing dark-bg">
                                    <a href="#" data-toggle="modal" data-target="#signup" class="theme-cl">
                                        <i class="fas fa-arrow-alt-circle-right mr-1"></i>Register
                                    </a>
                                </li>
                            </ul>

                        </c:when>
                        <c:otherwise>

                            <ul class="nav-menu nav-menu-social align-to-right dhsbrd">

                                <li>
                                    <div class="btn-group account-drop">
                                        <button type="button" class="btn btn-order-by-filt"
                                                data-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false">
                                            <img src="${sessionScope.user.userAvatar}" class="avater-img"
                                                 alt="">
                                                ${sessionScope.user.userDisplayName}(
                                            <c:choose>
                                                <c:when test="${sessionScope.user.role == 'admin'}">Admin</c:when>
                                                <c:when test="${sessionScope.user.role == 'owner'}">Landlord</c:when>
                                                <c:when test="${sessionScope.user.role == 'customer'}">Tenant</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>)
                                        </button>


                                        <c:choose>
                                            <%--  管理员  --%>
                                            <c:when test="${sessionScope.user.role == 'admin'}">
                                                <div class="dropdown-menu pull-right animated flipInX">
                                                    <a href="/admin/house">
                                                        <i class="ti-layers"></i>Property Management
                                                    </a>
                                                    <a href="/admin/order">
                                                        <i class="ti-gift"></i>Order Management
                                                    </a>
                                                    <a href="/admin/news">
                                                        <i class="ti-gift"></i>News Management
                                                    </a>
                                                    <a href="/logout">
                                                        <i class="ti-power-off"></i>Log out
                                                    </a>
                                                </div>
                                            </c:when>
                                            <%--  房东  --%>
                                            <c:when test="${sessionScope.user.role == 'owner'}">
                                                <div class="dropdown-menu pull-right animated flipInX">
                                                    <a href="/admin/profile">
                                                        <i class="ti-user"></i>Personal Infomation
                                                    </a>
                                                    <a href="/admin/house">
                                                        <i class="ti-layers"></i>Property Management
                                                    </a>
                                                    <a href="/admin/order">
                                                        <i class="ti-gift"></i>Order Management
                                                    </a>
                                                    <a href="/logout">
                                                        <i class="ti-power-off"></i>Log out
                                                    </a>
                                                </div>
                                            </c:when>
                                            <%--  租客  --%>
                                            <c:when test="${sessionScope.user.role == 'customer'}">
                                                <div class="dropdown-menu pull-right animated flipInX">
                                                    <a href="/admin/profile">
                                                        <i class="ti-user"></i>Personal Infomation
                                                    </a>
                                                    <a href="/admin/home">
                                                        <i class="ti-home"></i>My Home
                                                    </a>
                                                    <a href="/admin/mark">
                                                        <i class="ti-bookmark"></i>My Favorite 
                                                    </a>
                                                    <a href="/logout">
                                                        <i class="ti-power-off"></i>Log out
                                                    </a>
                                                </div>
                                            </c:when>
                                        </c:choose>


                                    </div>
                                </li>
                            </ul>
                        </c:otherwise>
                    </c:choose>


                </div>
            </nav>
        </div>
    </div>
    <!-- End Navigation -->
    <div class="clearfix"></div>
    <!-- ============================================================== -->
    <!-- Top header  -->
    <!-- ============================================================== -->
