package com.leecheck.mapper.main;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.leecheck.entity.main.SysUser;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户 Mapper 接口
 * </p>
 *
 * @author LQ
 * @since 2018-09-19
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    List<SysUser> selectUserList(RowBounds rowBounds, @Param("ew") Wrapper<SysUser> wrapper);

    List<Map> selectAllUser(Page page, Map param);

    int selectACount(Map param);
}
