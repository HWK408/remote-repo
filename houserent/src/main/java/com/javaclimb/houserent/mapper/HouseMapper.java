package com.javaclimb.houserent.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.vo.HouseSearchVO;
import com.javaclimb.houserent.entity.House;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 房子数据访问层
 */
@Mapper
public interface HouseMapper extends BaseMapper<House> {

    /**
     * 根据出租类型获取最新的n条房子信息
     * 像这种比较简单的sql，可以直接用注解的方式在方法上写
     */
    @Select("select * from t_house where status = 0 and rent_type = #{rentType} order by create_time desc limit #{limit}")
    public List<House> findTopList(@Param("rentType")String rentType,@Param("limit")Integer limit);

    /**
     * 搜索房子
     * 一个参数时，可以不写@Param；两个或以上的时候，一定要写@Param
     * 像这种比较复杂的sql，我们最好写在XML里，HouseMapper.xml
     */
    public List<House> searchHouse(@Param("houseSearchVO")HouseSearchVO houseSearchVO,@Param("page") Page page);

}
