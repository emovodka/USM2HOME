
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple" style="padding: 20px 0;">

    <div class="container" >

        <!-- row Start -->
        <div class="row">
            <div class="col-md-4">
                <div class="box box-solid" id="message-userlist-box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Chat List</h3>
                    </div>
                    <c:if test="${chatList.size() == 0}">
                        <p id="no-chat-tips">Chat List is empty</p>
                    </c:if>

                    <c:if test="${chatList.size() != 0}">
                        <div class="box-body no-padding">
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover">
                                    <tbody>

                                    <c:forEach items="${chatList}" var="message">

                                        <tr class="chat-list-tr <c:if test='${message.checked}'>chat-active</c:if>"
                                            onclick="loadChatList(${message.friendId})">
                                            <td class="mailbox-name" width="55">
                                                <c:if test="${message.friend != null}">
                                                    <img src="${message.friend.userAvatar}" class="user-image">
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${message.friend != null}">
                                                    <span>${message.friend.userDisplayName}</span>
                                                </c:if>

                                                <c:choose>
                                                    <c:when test="${message.status == 1}">
                                                        <span class="last-message-time pull-right text-maroon">
                                                                ${(message.createTime != null) ? message.easyCreateTime : '' }
                                                        </span>
                                                        <span class="pull-right text-green margin-r-5">Unread Messages</span>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>

                                                <p>
                                                    <c:choose>
                                                        <c:when test="message.content != null && message.content.length() > 30">
                                                            ${fn:substring(message.content, 0, 30)}
                                                        </c:when>
                                                        <c:otherwise>${message.content}</c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- /.table -->
                            </div>
                        </div>

                    </c:if>
                </div>

            </div>
            <div class="col-md-8">


                <c:choose>
                    <c:when test="${friend != null}">
                        <div class="box box-solid direct-chat direct-chat-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><span id="userDisplayName-span">${friend.userDisplayName}</span></h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="refresh"
                                            onclick="refresh()"><i
                                            class="fa fa-refresh"></i> Refresh
                                    </button>
<%--                                    <button type="button" class="btn btn-box-tool"--%>
<%--                                            onclick="clearAll(${friend.id})"--%>
<%--                                            id="remove-message-btn"><i--%>
<%--                                            class="fa fa-trash"></i> Clear History--%>
<%--                                    </button>--%>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div id="chat_container">
                                    <div id="chat_content" class="ps-container">
                                        <ul id="userchatUl" data-uid="${friend.id}" class="userchatUl">

                                            <c:forEach items="${messageList}" var="message">
                                                <li class="${message.userId == message.senderId ? 'me':'you'}">
                                                    <div class="chat_avata">
                                                        <c:if test="${message.user != null && message.friend != null}">
                                                            <img width="40" height="40" class="img_border_one"
                                                                 src="${message.userId == message.senderId ? message.user.userAvatar : message.friend.userAvatar}">
                                                        </c:if>
                                                    </div>
                                                    <div class="a_msg_info">
                                                        <pre>${message.content}</pre>
                                                        <i class="arrow_left_b"></i>
                                                    </div>
                                                    <small class="time">${message.easyCreateTime}</small>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <script>
                                            var div = document.getElementById('chat_container');
                                            div.scrollTop = div.scrollHeight;
                                        </script>
                                    </div>

                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <form action="/message/send" method="post">

                                        <div class="input-group" style="margin-top: 10px;">

                                            <input type="hidden" name="friendId" value="${friend.id}">
                                            <input type="text" name="content"
                                                   placeholder="Enter the content you want to send..."
                                                   class="form-control">
                                            <span class="input-group-btn">
                                            <button type="submit" id="message-send-btn"
                                                    class="btn btn-primary btn-flat">Send</button>
                                        </span>

                                        </div>
                                    </form>
                                </div>
                                <!-- /.box-footer-->
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="box box-solid direct-chat direct-chat-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Please select a chat</h3>
                            </div>
                            <div class="box-body">
                                <div id="no-message-container">
                                    <span id="no-message-tips">Chat with someone!</span>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
        <!-- /row -->

    </div>

</section>


<%@ include file="../common/footer.jsp" %>
<script>

    function loadChatList(uid) {
        window.location.href = '/message?uid=' + uid;
    }

    function refresh() {
        window.location.reload();
    }

    setInterval(refresh, 10000);//10秒刷新一次


    function clearAll(uid) {
        $.ajax({
            type: 'POST',
            url: '/message/clear?uid=' + uid,
            contentType: 'application/json',
            success: function (result) {
                $('#userchatUl').remove();
            },
            error: function () {
                alert('Operation failed');
            }
        });
    }
</script>
</body>
</html>
