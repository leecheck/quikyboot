package com.leecheck.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.leecheck.entity.main.SysUser;
import com.leecheck.service.ISysMenuService;
import com.leecheck.service.ISysRoleService;
import com.leecheck.service.ISysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by LQ on 2018/6/24.
 * i.lq.web.controller
 */
@Controller
@RequestMapping(value = {"", "/index"})
public class IndexController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysMenuService menuService;

    @Value("${path.sql}")
    private String sqlPath;

    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(value = "/get/users/page")
    public Object list(Model model) {
        Wrapper<SysUser> entity = new EntityWrapper<SysUser>();
        model.addAttribute("list", JSON.toJSONString(sysUserService.selectList(entity)));
        model.addAttribute("roles", roleService.selectList(null));
        model.addAttribute("menus", roleService.selectList(null));
        return "index";
    }

    @RequestMapping(value = "/get/users")
    @ResponseBody
    public Object listData() {
        Wrapper<SysUser> entity = new EntityWrapper<SysUser>();
        return sysUserService.selectList(entity);
    }


}
