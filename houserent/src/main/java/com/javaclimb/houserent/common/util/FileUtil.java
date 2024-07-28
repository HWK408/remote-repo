package com.javaclimb.houserent.common.util;

import com.javaclimb.houserent.common.constant.Constant;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 文件上传处理
 */
public class FileUtil {
    /**
     * 文件上传
     */
    public static Map<String,String> upload(MultipartFile file) throws Exception{
        Map<String,String> resultMap = new HashMap<>();
        File mediaPath = new File(Constant.UPLOADS_PATH);
        if(!mediaPath.exists()){
            if(!mediaPath.mkdirs()){
                throw new Exception("文件上传失败，无法创建文件夹");
            }
        }
        //原始文件名
        String originFileName = file.getOriginalFilename();
        //后缀
        String fileSuffix = originFileName.substring(originFileName.lastIndexOf(".")+1);
        //新文件名
        String nameWithoutSuffix = UUID.randomUUID().toString().replaceAll("-","");
        //带后缀的新文件名
        String newFileName = nameWithoutSuffix+"."+fileSuffix;
        //上传
        File descFile = new File(mediaPath.getAbsoluteFile(),newFileName);
        file.transferTo(descFile);
        //映射路径
        String filePath = Constant.UPLOADS_ABSOLUTE_PATH+newFileName;
        resultMap.put("fileName",originFileName);
        resultMap.put("filePath",filePath);
        resultMap.put("fileSuffix",fileSuffix);
        return resultMap;
    }
}
