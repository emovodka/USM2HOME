<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${sessionScope.user.userAvatar}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.userDisplayName} (${sessionScope.user.roleName})</p>
                <a href="#"><i class="fa fa-circle text-success"></i>online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">Basic information</li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>Basic information</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/profile"><i class="fa fa-circle-o"></i>Edit personal information</a></li>
                    <li><a href="/admin/password"><i class="fa fa-circle-o"></i>Change password</a></li>
                    <li><a href="/admin/mark"><i class="fa fa-circle-o"></i>Favorite Property</a></li>
                </ul>
            </li>
            <li><a href="/admin/home"><i class="fa fa-home"></i> <span>My Home</span></a></li>
            <li><a href="/admin/order"><i class="fa fa-database"></i> <span>Order management</span></a></li>
            <li class="header">Special functions</li>
            <li><a href="/admin/bill"><i class="fa fa-dollar"></i> <span>Bill management</span></a></li>
            <li><a href="/admin/maintain"><i class="fa fa-gavel"></i> <span>Maintenance management</span></a></li>
            <li><a href="/admin/feedbackSurvey"><i class="fa fa-star"></i> <span>Feedback Survey</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-bell"></i> <span>Message management</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/post"><i class="fa fa-circle-o"></i>My post</a></li>
                    <li><a href="/admin/comment"><i class="fa fa-circle-o"></i>My comment</a></li>
                    <li><a href="/admin/feedback"><i class="fa fa-circle-o"></i>My feedback</a></li>
                    <li><a href="/message" target="_blank"><i class="fa fa-circle-o"></i>My message
                        <c:if test="${sessionScope.user.notReadMessageCount !=0}">
                        <span
                                class="pull-right-container"><small
                                class="label pull-right bg-red">${sessionScope.user.notReadMessageCount}</small></span>
                        </c:if>
                    </a></li>
                </ul>
            </li>
            <li><a href="/logout"><i class="fa fa-sign-out"></i> <span>Log out</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>