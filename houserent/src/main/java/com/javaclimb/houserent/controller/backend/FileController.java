package com.javaclimb.houserent.controller.backend;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件上传控制器
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    /**
     * 文件上传
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult upload(@RequestParam("file")MultipartFile file, @RequestParam("key")String key, HttpSession session){
        Map<String,String> map = new HashMap<>();
        try {
            map = FileUtil.upload(file);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.error("上传失败");
        }
        String filePath = map.get("filePath");
        //将图片URL存在session中
        String sessionKey = Constant.SESSION_IMG_PREFIX + key;
        List<String> imgList = (List<String>) session.getAttribute(sessionKey);
        if(imgList == null){
            imgList = new ArrayList<>();
        }
        imgList.add(filePath);
        session.setAttribute(sessionKey,imgList);
        return JsonResult.success("上传成功");
    }
}


















