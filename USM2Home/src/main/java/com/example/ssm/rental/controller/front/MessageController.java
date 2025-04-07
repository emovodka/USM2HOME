package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.MessageStatusEnum;
import com.example.ssm.rental.entity.Message;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.MessageService;
import com.example.ssm.rental.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Controller
public class MessageController extends BaseController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 聊天页面
     *
     * @param uid
     * @param model
     * @return
     */
    @RequestMapping(value = "/message", method = RequestMethod.GET)
    public String messages(
            @RequestParam(value = "uid", required = false) Long uid,
            HttpSession session, Model model) throws Exception {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return "redirect:/login";
        }
        List<Message> chatList = messageService.getChatList(loginUser.getId());


        //1、左侧的聊天列表
        List<Integer> statusList = new ArrayList<>();
        statusList.add(MessageStatusEnum.HAD_READ_MESSAGE.getCode());
        statusList.add(MessageStatusEnum.NOT_READ_MESSAGE.getCode());

        //有指定的用户，则默认打开与指定的用户的聊天框
        if (uid != null) {
            User friend = userService.get(uid);
            if (friend == null) {
                throw new Exception("user not found");
            }

            List<Message> messageList = messageService.getMessageList(loginUser.getId(), uid, statusList);
            //3、将所有未读状态改为已读
            if (messageList.size() > 0) {
                for (int i = 0; i < messageList.size(); i++) {
                    //未读标记为已读
                    if (messageList.get(i).getStatus().equals(MessageStatusEnum.NOT_READ_MESSAGE.getCode())) {
                        Message temp = messageList.get(i);
                        temp.setStatus(MessageStatusEnum.HAD_READ_MESSAGE.getCode());
                        messageService.saveMessage(temp);
                    }
                }
            }

            for (Message message : chatList) {
                if (Objects.equals(message.getFriendId(), uid)) {
                    message.setChecked(true);
                }
            }

            model.addAttribute("messageList", messageList);
            model.addAttribute("friend", friend);

        }
        model.addAttribute("chatList", chatList);
        return "front/message";
    }

    /**
     * 发布私信
     *
     * @param friendId
     * @param content
     * @return
     */
    @RequestMapping(value = "/message/send", method = RequestMethod.POST)
    public String createMessage(@RequestParam("friendId") Long friendId,
                                @RequestParam("content") String content,
                                HttpSession session) throws Exception {

        //1、判断friendId是否存在
        User friend = userService.get(friendId);
        if (friend == null) {
            throw new Exception("user not found");
        }
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return "redirect:/login";
        }

        //2、添加两条message
        //自己的一条消息
        Message myMessage = new Message(loginUser.getId(), friend.getId(), loginUser.getId(), friend.getId(), content, MessageStatusEnum.HAD_READ_MESSAGE.getCode());
        //对方的一条消息
        Message yourMessage = new Message(friend.getId(), loginUser.getId(), loginUser.getId(), friend.getId(), content, MessageStatusEnum.NOT_READ_MESSAGE.getCode());
        messageService.saveMessage(myMessage);
        messageService.saveMessage(yourMessage);
        return "redirect:/message?uid=" + friendId;

    }
    
    

    /**
     * 清空与一个好友的私信
     *
     * @param friendId
     * @return
     */
    @RequestMapping(value = "/message/clear", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult clearMessage(@RequestParam("uid") Long friendId,
                                   HttpSession session) throws Exception {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("please login first");
        }
        User friend = userService.get(friendId);
        if (friend == null) {
            throw new Exception("user not found");
        }
        // 修改状态
        List<Integer> statusList = new ArrayList<>();
        statusList.add(MessageStatusEnum.NOT_READ_MESSAGE.getCode());
        statusList.add(MessageStatusEnum.HAD_READ_MESSAGE.getCode());
        List<Message> messageList = messageService.getMessageList(loginUser.getId(), friend.getId(), statusList);
        for (int i = 0; i < messageList.size(); i++) {
            Message message = messageList.get(i);
            message.setStatus(MessageStatusEnum.DELETE_MESSAGE.getCode());
            messageService.saveMessage(message);
        }
        return JsonResult.success("success");

    }


    /**
     * 未读消息数量
     *
     * @return
     */
    @RequestMapping(value = "/message/notReadCount", method = RequestMethod.GET)
    @ResponseBody
    public JsonResult clearMessage(HttpSession session) {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("please login first");
        }

        Integer notReadCount = messageService.countNotReadMessageSize(loginUser.getId());
        return JsonResult.success("success", notReadCount);

    }


}
