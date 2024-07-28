package com.javaclimb.houserent.controller.backend;

import cn.hutool.http.HtmlUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.News;
import com.javaclimb.houserent.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 新闻资讯控制器
 */
@Controller("backendNewsController")
@RequestMapping("/admin/news")
public class NewsController extends BaseController {

    @Autowired
    private NewsService newsService;

    /**
     * 进入新闻资讯管理页面
     */
    @RequestMapping("")
    public String newsList(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model){
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        News condition = new News();
        Page<News> newsPage = newsService.findAll(page,condition);
        model.addAttribute("pageInfo",newsPage);
        model.addAttribute("pagePrefix","/admin/news?");
        model.addAttribute("tab","news-list");
        return "admin/news-list";
    }

    /**
     * 进入新闻资讯发布页面
     */
    @RequestMapping("/publish")
    public String publish(@RequestParam(value = "id",required = false)Long id,Model model){
        News news = new News();
        //编辑页面
        if(id!=null){
            news = newsService.get(id);
            if(news==null){
                return renderNotFound();
            }
        }
        model.addAttribute("news",news);
        return "admin/news-publish";
    }

    /**
     * 发布新闻资讯提交
     * @return
     */
    @RequestMapping(value = "/publish/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult publishSubmit(News news){
        try{
            if(news.getId()==null){        //新增
                news.setCreateTime(new Date());
            }else{                      //修改
                News queryNews = newsService.get(news.getId());
                if(queryNews==null){
                    return JsonResult.error("发布失败，没有这个新闻资讯");
                }
            }
            //提取摘要
            int postSummary = 300;
            String summaryText = HtmlUtil.cleanHtmlTag(news.getContent());
            if(summaryText.length()>postSummary){
                String summary = summaryText.substring(0,postSummary);
                news.setSummary(summary);
            }else {
                news.setSummary(summaryText);
            }
            newsService.insertOrUpdate(news);
        }catch (Exception e){
            return JsonResult.error("发布失败，请填写完整信息");
        }
        return JsonResult.success("发布成功",news.getId());
    }

    /**
     * 删除
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult deleteNews(@RequestParam("id")Long id){
        try{
            News news = newsService.get(id);
            if(news==null){
                return JsonResult.error("没有这个新闻资讯");
            }
            newsService.delete(id);
        }catch (Exception e){
            return JsonResult.error("删除新闻资讯失败");
        }
        return JsonResult.success("删除成功");
    }

}
