package com.leecheck.Base;

import com.alibaba.fastjson.JSON;

import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * Created by LQ on 2018/9/11.
 * controller
 */
public class BaseController extends BaseLogger {

    /**
     * 重定向
     *
     * @param url
     * @return
     */
    protected String redirectTo(String url) {
        StringBuffer rto = new StringBuffer("redirect:");
        rto.append(url);
        return rto.toString();
    }

    /**
     * str转utf-8 转map
     *
     * @param paramsStr
     * @return
     */
    protected Map<String, String> parseParams(String paramsStr) throws UnsupportedEncodingException {
        String paramstr = java.net.URLDecoder.decode(paramsStr, "utf-8");
        return JSON.parseObject(paramstr, Map.class);
    }

    /**
     * str转utf-8 转map
     *
     * @param paramsStr
     * @return
     */
    protected String parseParam(String paramsStr) throws UnsupportedEncodingException {
        return java.net.URLDecoder.decode(paramsStr, "utf-8");
    }


}
