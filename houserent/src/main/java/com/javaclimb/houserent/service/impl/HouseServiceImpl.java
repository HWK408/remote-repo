package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.mapper.HouseMapper;
import com.javaclimb.houserent.service.HouseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 房子服务接口实现
 */
@Service
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseMapper houseMapper;

    /**
     * mapper对象
     */
    @Override
    public BaseMapper<House> getRepository() {
        return houseMapper;
    }

    /**
     * 获得查询器
     *
     * @param house
     */
    @Override
    public QueryWrapper<House> getQueryWrapper(House house) {
        QueryWrapper<House> queryWrapper = new QueryWrapper<>();
        if(house!=null&&house.getUserId()!=null){
            queryWrapper.eq("user_id",house.getUserId());
        }
        return queryWrapper;
    }

    /**
     * 获得带参数的查询器
     *
     * @param condition
     */
    @Override
    public QueryWrapper<House> getQueryWrapper(Map<String, Object> condition) {
        return null;
    }

    /**
     * 根据用户id和房产证编号查询合租房子
     */
    @Override
    public List<House> findByUserIdAndCetificateNoAndRentType(Long userId, String cetificateNo, String rentType) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_id",userId);
        queryWrapper.eq("cetificate_no",cetificateNo);
        queryWrapper.eq("rent_type",rentType);
        return houseMapper.selectList(queryWrapper);
    }

    /**
     * 根据出租类型获取最新的n条房子信息
     *
     * @param rentType 租房类型
     * @param limit 限制多少条
     */
    @Override
    public List<House> findTopList(String rentType, Integer limit) {
        return houseMapper.findTopList(rentType,limit);
    }

    /**
     * 获得房子分页数据
     *
     * @param houseSearchVO
     * @param page
     */
    @Override
    public Page<House> getHousePage(HouseSearchVO houseSearchVO, Page<House> page) {
        if(houseSearchVO ==null){
            houseSearchVO = new HouseSearchVO();
        }else{
            //价格范围
            String priceRange = houseSearchVO.getPriceRange();
            Integer minPrice = 0;
            Integer maxPrice = 20000;
            if(StringUtils.isNotEmpty(priceRange)){
                String[] arr = priceRange.split(";");
                if(arr.length == 2){
                    minPrice = Integer.valueOf(arr[0]);
                    maxPrice = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMinPrice(minPrice);
            houseSearchVO.setMaxPrice(maxPrice);
            //面积范围
            String areaRange = houseSearchVO.getAreaRange();
            Integer minArea = 0;
            Integer maxArea = 150;
            if(StringUtils.isNotEmpty(areaRange)){
                String[] arr = areaRange.split(";");
                if(arr.length == 2){
                    minArea = Integer.valueOf(arr[0]);
                    maxArea = Integer.valueOf(arr[1]);
                }
            }
            houseSearchVO.setMinArea(minArea);
            houseSearchVO.setMaxArea(maxArea);
        }
        List<House> list = houseMapper.searchHouse(houseSearchVO,page);
        page.setRecords(list);
        return page;
    }
}
