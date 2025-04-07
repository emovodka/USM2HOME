package com.example.ssm.rental.controller.backend;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.common.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class FileController extends BaseController {


    /**
     * 照片上传
     *
     * @param file 文件
     * @param key
     * @return JsonResult
     */
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult uploadFile(@RequestParam("file") MultipartFile file,
                                 @RequestParam("key") String key,
                                 HttpSession session) {
        Map<String, String> resultMap = null;
        try {
            resultMap = FileUtil.upload(file);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("upload failed");
        }
        String filePath = resultMap.get("filePath");


        // 把图片URL存在session中
        String sessionKey = Constant.SESSION_IMG_PREFIX + key;
        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
        if (imgList == null) {
            imgList = new ArrayList<>();
        }
        imgList.add(filePath);
        session.setAttribute(sessionKey, imgList);
        return JsonResult.success("upload success");
    }

    /**
     * 照片上传
     *
     * @param file 文件
     * @return JsonResult
     */
    @RequestMapping(value = "/file/upload/simple", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult uploadFile2(@RequestParam("file") MultipartFile file,
                                 HttpSession session) {
        Map<String, String> resultMap = null;
        try {
            resultMap = FileUtil.upload(file);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("upload failed");
        }
        String filePath = resultMap.get("filePath");
        return JsonResult.success("upload success", filePath);
    }
}
