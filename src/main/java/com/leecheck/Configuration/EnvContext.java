package com.leecheck.Configuration;

import com.leecheck.entity.main.SysUser;
import com.leecheck.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by LQ on 2018/9/14.
 * com.leecheck.Configuration
 */
public class EnvContext {

    public EnvContext(Date data) {
        this.sysStartDate = data;
    }

    private Date sysStartDate;

    @Autowired
    private ISysUserService sysUserService;

    public Date getSysStartData() {
        return sysStartDate;
    }

    public SysUser getCurrentUser() {
        return sysUserService.findByUserName("admin");
    }
}
