package com.leecheck.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.leecheck.LocalEntity.Res;
import com.leecheck.entity.main.SysUser;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 * 用户 服务类
 * </p>
 *
 * @author LQ
 * @since 2018-09-19
 */
public interface ISysUserService extends IService<SysUser> {

    SysUser findByUserName(String username);

    Res del(Long userId);

    Res addUser(SysUser user);

    Res editPass(Long userId, String password);

    Page query(Map paramMap);

    Boolean usernameDump(String username, Long userId);//验证 username 重复
}
