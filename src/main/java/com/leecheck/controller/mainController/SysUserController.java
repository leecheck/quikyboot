package com.leecheck.controller.mainController;

import com.alibaba.fastjson.JSON;
import com.leecheck.Base.BaseController;
import com.leecheck.Configuration.EnvContext;
import com.leecheck.entity.main.*;
import com.leecheck.service.*;
import com.leecheck.LocalEntity.Res;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * Created by LQ on 2018/9/12.
 * controller.mainController
 */
@Controller
@RequestMapping(value = "/admin/sysUser")
public class SysUserController extends BaseController {

    @Autowired
    private EnvContext emv;

    @Autowired
    private ISysUserService sysUserService;

    @RequestMapping(value = "/list")
    public Object list(Model model) {
        return "sysadmin/sysUser";
    }

    @RequestMapping(value = "/listUser")
    public Object listuser(Model model) {
        return "work/user";
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public Object query(@RequestParam String param) {
        Res res = new Res();
        try {
            Map paramMap = parseParams(param);
            return res.success().data(sysUserService.query(paramMap));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return res.reason("");
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason("");
        }
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(@RequestParam String user) {
        Res res = new Res();
        try {
            String parsed = parseParam(user);
            SysUser sysUser = JSON.parseObject(parsed, SysUser.class);
            return sysUserService.addUser(sysUser);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return res.reason("");
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason("");
        }
    }

    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object edit(@RequestParam String user) {
        Res res = new Res();
        try {
            String parsed = parseParam(user);
            SysUser sysUser = JSON.parseObject(parsed, SysUser.class);
            if (sysUserService.insertOrUpdate(sysUser)) {
                return res.success();
            }
            return res.reason("");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return res.reason("JSON解析出错");
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason(e.getMessage());
        }
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public Object del(@RequestParam Long userId) {
        Res res = new Res();
        try {
            return sysUserService.del(userId);
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason(e.getMessage());
        }
    }

    @RequestMapping(value = "/edit/pass")
    @ResponseBody
    public Object pass(@RequestParam Long userId, @RequestParam String password) {
        Res res = new Res();
        try {
            return sysUserService.editPass(userId, password);
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason(e.getMessage());
        }
    }

    @RequestMapping(value = "/usernameDump")
    @ResponseBody
    public Object usernameDump(String username, Long userId) {
        Res res = new Res();
        try {
            return res.success().data(sysUserService.usernameDump(username, userId));
        } catch (Exception e) {
            e.printStackTrace();
            return res.reason(e.getMessage());
        }
    }

}
