package com.example.ssm.rental.controller.front;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Comment;
import com.example.ssm.rental.entity.Post;
import com.example.ssm.rental.service.CommentService;
import com.example.ssm.rental.service.PostService;
import com.example.ssm.rental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 文章控制器
 */
@Controller
public class PostController extends BaseController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    /**
     * 文章资讯列表
     *
     * @param pageNumber
     * @param pageSize
     * @param model
     * @return
     */
    @RequestMapping(value = "/post")
    public String index(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                        @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                        Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Page<Post> postPage = postService.findAll(page);
        model.addAttribute("pageInfo", postPage);
        model.addAttribute("pagePrefix", "/post?");
        return "front/post-list";
    }




    /**
     * 文章详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/post/detail/{id}")
    public String postDetail(@PathVariable("id") Long id, Model model) {
        Post post = postService.get(id);
        if (post == null) {
            return this.renderNotFound();
        }
        post.setUser(userService.get(post.getUserId()));
        model.addAttribute("post", post);

        // 文章列表
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("post_id", id);
        List<Comment> commentList =  commentService.findAll(queryWrapper);
        for(Comment comment :commentList) {
            comment.setUser(userService.get(comment.getUserId()));
        }
        model.addAttribute("commentList", commentList);

        return "front/post-detail";
    }
}
