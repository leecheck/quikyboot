package com.leecheck.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.leecheck.LocalEntity.Res;
import com.leecheck.Utils.MD5Util;
import com.leecheck.entity.main.SysUser;
import com.leecheck.mapper.main.SysUserMapper;
import com.leecheck.service.ISysUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author LQ
 * @since 2018-09-19
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public SysUser findByUserName(String username) {
        EntityWrapper<SysUser> ew = new EntityWrapper<>();
        ew.eq("username", username);
        List<SysUser> sysUsers = sysUserMapper.selectList(ew);
        if (sysUsers.size() > 0) {
            return sysUsers.get(0);
        }
        return null;
    }

    @Transactional
    @Override
    public Res del(Long userId) {
        Res res = new Res();
        SysUser sysUser = selectById(userId);
        if (sysUser == null) {
            return res.data(false).reason("已不存在id为" + userId + "的用户");
        }
        boolean flag = deleteById(userId);
        return res.data(false).reason("");
    }

    @Override
    public Res addUser(SysUser sysUser) {
        Res res = new Res();
        sysUser.setPassword(MD5Util.encode(sysUser.getPassword()));
        Date now = new Date();
        sysUser.setCreateTime(now);
        sysUser.setUpdateTime(now);
        sysUser.setCreateUserId(1L);
        if (insert(sysUser)) {
            return res.success();
        }
        return res.reason("");
    }

    @Override
    public Res editPass(Long userId, String password) {
        Res res = new Res();
        SysUser sysUser = selectById(userId);
        if (sysUser == null) {
            return res.reason("");
        }
        String pass = MD5Util.encode(password);
        sysUser.setPassword(pass);
        if (updateById(sysUser)) {
            return res.success();
        }
        return res.reason("");
    }

    @Override
    public Page query(Map paramMap) {
        Page pageEntity = new Page<SysUser>(1, Integer.MAX_VALUE);
        pageEntity.setRecords(sysUserMapper.selectAllUser(pageEntity, paramMap));
        return pageEntity;
    }

    @Override
    public Boolean usernameDump(String username, Long userId) {
        Wrapper<SysUser> entity = new EntityWrapper<SysUser>();
        if (userId == null) {
            entity.eq("username", username);
            List<SysUser> users = selectList(entity);
            if (users.size() > 0) {
                return true;
            }
        }
        entity.eq("username", username);
        entity.and().ne("id", userId);
        List<SysUser> users = selectList(entity);
        if (users.size() > 0) {
            return true;
        }
        return false;
    }
}
