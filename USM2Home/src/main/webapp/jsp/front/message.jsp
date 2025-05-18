<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>

<style>
body {
    font-family: 'Inter', 'Roboto', 'Arial', sans-serif;
    background: #f7f7fa;
    color: #222;
}

.message-container {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 2px 16px rgba(110,18,126,0.10);
    margin-bottom: 32px;
    border: 1px solid rgba(110,18,126,0.08);
    overflow: hidden;
}

.message-header {
    background: #6e127e;
    color: #fff;
    padding: 20px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

.message-header h3 {
    margin: 0;
    font-size: 1.3rem;
    font-weight: 600;
}

.chat-list {
    height: calc(100vh - 250px);
    overflow-y: auto;
    background: #fff;
}

.chat-list-tr {
    padding: 15px 20px;
    border-bottom: 1px solid rgba(110,18,126,0.08);
    cursor: pointer;
    transition: box-shadow 0.2s, background 0.2s;
    border-radius: 12px;
    margin-bottom: 8px;
}

.chat-list-tr:hover, .chat-list-tr.chat-active {
    background: #f3e6f7;
    box-shadow: 0 4px 16px rgba(110,18,126,0.10);
}

.chat-list-tr.chat-active {
    background: #faf7fb;
    border-left: 4px solid #6e127e;
}

.user-image {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #6e127e;
}

.last-message-time {
    font-size: 0.85rem;
    color: #888;
}

.text-green {
    color: #6e127e !important;
    font-size: 0.85rem;
    font-weight: 500;
}

.chat-container {
    height: calc(100vh - 250px);
    display: flex;
    flex-direction: column;
}

.chat-content {
    flex: 1;
    overflow-y: auto;
    padding: 20px;
    background: #faf7fb;
}

.userchatUl {
    list-style: none;
    padding: 0;
    margin: 0;
}

.userchatUl li {
    display: flex;
    margin-bottom: 20px;
    align-items: flex-start;
}

.userchatUl li.me {
    flex-direction: row-reverse;
}

.chat_avata {
    margin: 0 12px;
}

.chat_avata img {
    border-radius: 50%;
    border: 2px solid #6e127e;
}

.a_msg_info {
    background: #fff;
    padding: 12px 16px;
    border-radius: 12px;
    max-width: 70%;
    position: relative;
    box-shadow: 0 2px 8px rgba(110,18,126,0.08);
}

.me .a_msg_info {
    background: #6e127e;
    color: #fff;
}

.a_msg_info pre {
    margin: 0;
    white-space: pre-wrap;
    font-family: inherit;
    font-size: 1rem;
    line-height: 1.5;
}

.arrow_left_b {
    position: absolute;
    top: 12px;
    left: -8px;
    border: 8px solid transparent;
    border-right-color: #fff;
}

.me .arrow_left_b {
    left: auto;
    right: -8px;
    border-right-color: transparent;
    border-left-color: #6e127e;
}

.time {
    font-size: 0.8rem;
    color: #888;
    margin: 4px 12px;
}

.chat-footer {
    padding: 20px;
    background: #fff;
    border-top: 1px solid rgba(110,18,126,0.08);
}

.input-group {
    display: flex;
    gap: 10px;
}

.input-group input {
    flex: 1;
    border: 1px solid rgba(110,18,126,0.2);
    border-radius: 8px;
    padding: 12px 16px;
    font-size: 1rem;
    transition: all 0.2s;
}

.input-group input:focus {
    border-color: #6e127e;
    box-shadow: 0 0 0 3px rgba(110,18,126,0.1);
    outline: none;
}

.btn-primary {
    background: #6e127e;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.2s;
}

.btn-primary:hover {
    background: #4d0e5e;
    transform: translateY(-1px);
}

.no-chat-tips {
    text-align: center;
    padding: 40px 20px;
    color: #888;
    font-size: 1.1rem;
}

.avatar-initial {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: linear-gradient(135deg, #b47ddb 0%, #6e127e 100%);
    color: #fff;
    font-size: 1.5rem;
    font-weight: 700;
    border: 2px solid #6e127e;
    box-shadow: 0 2px 8px rgba(110,18,126,0.10);
    margin-right: 12px;
    letter-spacing: 1px;
}

.chat-list-username {
    font-weight: 700;
    font-size: 1.08rem;
    color: #222;
}
.chat-list-message {
    color: #a08bb7;
    font-size: 0.98rem;
    margin-top: 2px;
    margin-bottom: 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.unread-dot {
    display: inline-block;
    width: 9px;
    height: 9px;
    background: #6e127e;
    border-radius: 50%;
    margin-left: 8px;
    vertical-align: middle;
}

@media (max-width: 991px) {
    .chat-list, .chat-container {
        height: calc(100vh - 200px);
    }
    
    .a_msg_info {
        max-width: 85%;
    }
}
</style>

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple" style="padding: 20px 0;">
    <div class="container">
        <div class="row">
            <!-- Chat List -->
            <div class="col-md-4">
                <div class="message-container">
                    <div class="message-header">
                        <h3>Chat List</h3>
                    </div>
                    <div class="chat-list">
                        <c:if test="${chatList.size() == 0}">
                            <p class="no-chat-tips">Chat List is empty</p>
                        </c:if>

                        <c:if test="${chatList.size() != 0}">
                            <c:forEach items="${chatList}" var="message">
                                <div class="chat-list-tr${message.checked ? ' chat-active' : ''}" onclick="loadChatList(${message.friendId})">
                                    <div style="display:flex;align-items:center;">
                                        <c:choose>
                                            <c:when test="${message.friend.userAvatar != null && !empty message.friend.userAvatar}">
                                                <img src="${message.friend.userAvatar}" class="user-image">
                                            </c:when>
                                            <c:otherwise>
                                                <span class="avatar-initial">
                                                    ${fn:substring(message.friend.userDisplayName,0,1)}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                        <div style="flex:1;min-width:0;">
                                            <div style="display:flex;align-items:center;justify-content:space-between;">
                                                <span class="chat-list-username">${message.friend.userDisplayName}</span>
                                                <c:if test="${message.status == 1}">
                                                    <span class="unread-dot"></span>
                                                </c:if>
                                            </div>
                                            <div class="chat-list-message">
                                                <c:choose>
                                                    <c:when test="message.content != null && message.content.length() > 30">
                                                        ${fn:substring(message.content, 0, 30)}
                                                    </c:when>
                                                    <c:otherwise>${message.content}</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Chat Window -->
            <div class="col-md-8">
                <c:choose>
                    <c:when test="${friend != null}">
                        <div class="message-container">
                            <div class="message-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h3><span id="userDisplayName-span">${friend.userDisplayName}</span></h3>
                                    <button type="button" class="btn btn-light" onclick="refresh()">
                                        <i class="fa fa-refresh"></i> Refresh
                                    </button>
                                </div>
                            </div>
                            <div class="chat-container">
                                <div class="chat-content" id="chat_container">
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
                                </div>
                                <div class="chat-footer">
                                    <form action="/message/send" method="post">
                                        <div class="input-group">
                                            <input type="hidden" name="friendId" value="${friend.id}">
                                            <input type="text" name="content"
                                                   placeholder="Type your message here..."
                                                   class="form-control">
                                            <button type="submit" id="message-send-btn"
                                                    class="btn btn-primary">Send</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="message-container">
                            <div class="message-header">
                                <h3>Welcome to Chat</h3>
                            </div>
                            <div class="chat-container">
                                <div class="chat-content d-flex align-items-center justify-content-center">
                                    <p class="no-chat-tips">Select a chat to start messaging!</p>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
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

    // 自动滚动到底部
    var chatContainer = document.getElementById('chat_container');
    if (chatContainer) {
        chatContainer.scrollTop = chatContainer.scrollHeight;
    }
</script>
</body>
</html>
