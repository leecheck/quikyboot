package com.leecheck.service.adminService;

import com.alibaba.fastjson.JSON;
import com.leecheck.Base.BaseLogger;
import com.leecheck.AppApplication;
import com.leecheck.service.impl.SysUserServiceImpl;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by LQ on 2018/9/14.
 * com.leecheck.controller.mainController
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = AppApplication.class)
public class SysUserServiceTest extends BaseLogger {

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Before
    public void before() throws Exception {
        logger.info("before");
    }

    @After
    public void after() throws Exception {
        logger.info("after");
    }

    @Test
    public void test_query() throws Exception {
        logger.info("test_query:" + "main");
        String content = JSON.toJSONString(sysUserService.findByUserName("main"));
        logger.info("test_query_result：" + content);
    }

    @Test
    public void test_test() throws Exception {
        logger.info("test_query_result：" + "test");
    }

}
