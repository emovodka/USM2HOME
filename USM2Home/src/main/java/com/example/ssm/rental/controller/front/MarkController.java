package com.example.ssm.rental.controller.front;

import com.example.ssm.rental.common.base.BaseController;
import com.example.ssm.rental.common.dto.JsonResult;
import com.example.ssm.rental.entity.Mark;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 收藏控制器
 *
 */
@RestController("markController")
public class MarkController extends BaseController {

    @Autowired
    private MarkService markService;

    /**
     * 收藏提交
     *
     * @param houseId
     * @return
     */
    @RequestMapping(value = "/mark/submit", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submit(@RequestParam("houseId") Long houseId) {
        User loginUser = getLoginUser();
        if (loginUser == null) {
            return JsonResult.error("please login first");
        }


        // 判断是否已经收藏过了
        List<Mark> markList = markService.findByUserIdAndHouseId(loginUser.getId(), houseId);
        if (markList != null && markList.size() > 0) {
            return JsonResult.error("already marked");
        }


        Mark mark = new Mark();
        mark.setCreateTime(new Date());
        mark.setUserId(loginUser.getId());
        mark.setHouseId(houseId);
        markService.insert(mark);
        return JsonResult.success("marked successfully");
    }
}
