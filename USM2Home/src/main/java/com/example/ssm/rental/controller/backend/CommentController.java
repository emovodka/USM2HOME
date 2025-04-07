package com.example.ssm.rental.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Comment;
import com.example.ssm.rental.entity.Post;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.CommentService;
import com.example.ssm.rental.service.PostService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Objects;

/**
 * 留言控制器
 *
 */
@Controller("backCommentController")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    /**
     * 留言管理
     * 包括我的留言和我收到的留言
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/comment")
    public String allComment(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                             @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                             Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        // 如果登录用户不是管理员，查询该用户的留言，否则管理员查询所有的留言
        QueryWrapper queryWrapper = new QueryWrapper();
        if (!loginUserIsAdmin()) {
            queryWrapper.eq("user_id", getLoginUserId());
            queryWrapper.or();
            queryWrapper.eq("post_user_id", getLoginUserId());
        }

        Page<Comment> commentPage = commentService.findAll(page, queryWrapper);
        for (Comment temp : commentPage.getRecords()) {
            temp.setUser(userService.get(temp.getUserId()));
            temp.setPost(postService.get(temp.getPostId()));
        }
        model.addAttribute("pageInfo", commentPage);

        model.addAttribute("tab", "comment-list");
        model.addAttribute("pagePrefix", "/admin/comment?");

        return "admin/comment-list";
    }


    /**
     * 发布留言提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/comment/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(Comment comment, HttpSession session) {
        User user = getLoginUser();
        if (user == null) {
            return JsonResult.error("user not login");
        }

        try {
            // 发布留言，设置用户ID
            if (comment.getId() == null) {
                comment.setCreateTime(new Date());
                comment.setUserId(getLoginUserId());

                Post post = postService.get(comment.getPostId());
                if(post == null) {
                    return JsonResult.error("post not found");
                }

                comment.setPostUserId(post.getUserId());
            }
            comment.setContent(HtmlUtil.cleanHtmlTag(comment.getContent()));
            commentService.insertOrUpdate(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("publish failed, please fill in the complete information");
        }
        return JsonResult.success("publish success", comment.getId());
    }


    /**
     * 删除留言
     *
     * @return
     */
    @RequestMapping(value = "/admin/comment/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deleteComment(@RequestParam("id") Long id) {
        try {
            Comment comment = commentService.get(id);
            if (comment == null) {
                return JsonResult.error("comment not found");
            }
            // 文章作者、评论人和管理员可以删除
            if (!loginUserIsAdmin() && !Objects.equals(comment.getUserId(), getLoginUserId()) && !Objects.equals(comment.getPostUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to delete");
            }
            commentService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete comment failed");
        }
        return JsonResult.success("delete comment success");
    }


}
