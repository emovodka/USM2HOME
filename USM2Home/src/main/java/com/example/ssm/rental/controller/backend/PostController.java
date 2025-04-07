package com.example.ssm.rental.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.enums.PostTypeEnum;
import com.example.ssm.rental.common.util.PageUtil;
import com.example.ssm.rental.entity.Post;
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
 * 招租文章控制器
 *
 * @author example
 */
@Controller("backPostController")
public class PostController extends BaseController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    /**
     * 文章管理
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/post")
    public String allPost(@RequestParam(value = "page", defaultValue = "1") Integer pageNumber,
                          @RequestParam(value = "size", defaultValue = "6") Integer pageSize,
                          Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize);
        Post condition = new Post();
        // 如果登录用户不是管理员，查询该用户的文章，否则管理员查询所有的文章
        if (!loginUserIsAdmin()) {
            condition.setUserId(getLoginUserId());
        }
        Page<Post> postPage = postService.findAll(page, condition);
        for (Post temp : postPage.getRecords()) {
            temp.setUser(userService.get(temp.getUserId()));
        }

        model.addAttribute("pageInfo", postPage);

        model.addAttribute("tab", "post-list");
        model.addAttribute("pagePrefix", "/admin/post?");

        return "admin/post-list";
    }



    /**
     * 发布/编辑文章信息
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/post/publish")
    public String publish(@RequestParam(value = "id", required = false) Long id, Model model) {
        Post post;
        if (id != null) {
            // 如果要编辑的文章不存在，则跳转404
            post = postService.get(id);
            if (post == null) {
                return this.renderNotFound();
            }
            // 如果编辑别人的文章，则跳转403
            if (!loginUserIsAdmin() && !Objects.equals(post.getUserId(), getLoginUserId())) {
                return this.renderNotAllowAccess();
            }
        } else {
            post = new Post();
        }
        model.addAttribute("post", post);
        model.addAttribute("tab", "post-publish");
        return "admin/post-publish";
    }


    /**
     * 发布文章提交
     *
     * @return
     */
    @RequestMapping(value = "/admin/post/publish/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(Post post, HttpSession session) {
        try {
            // 发布文章，设置用户ID
            if (post.getId() == null) {
                post.setCreateTime(new Date());
                post.setUserId(getLoginUserId());
                post.setPostType(PostTypeEnum.QIU_ZU.getValue());
            }
            // 提取摘要
            int postSummary = 300;
            String summaryText = HtmlUtil.cleanHtmlTag(post.getContent());
            if (summaryText.length() > postSummary) {
                String summary = summaryText.substring(0, postSummary);
                post.setSummary(summary);
            } else {
                post.setSummary(summaryText);
            }
            post.setContent(HtmlUtil.cleanHtmlTag(post.getContent()));
            postService.insertOrUpdate(post);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("publish failed, please fill in the complete information");
        }
        return JsonResult.success("publish success", post.getId());
    }


    /**
     * 删除文章
     *
     * @return
     */
    @RequestMapping(value = "/admin/post/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult deletePost(@RequestParam("id") Long id) {
        try {
            Post post = postService.get(id);
            if (post == null) {
                return JsonResult.error("post not found");
            }
            if (!loginUserIsAdmin() && !Objects.equals(post.getUserId(), getLoginUserId())) {
                return JsonResult.error("no permission to delete, this is not your post");
            }
            postService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("delete post failed");
        }
        return JsonResult.success("delete post success");
    }


}
