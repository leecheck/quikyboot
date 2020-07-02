package com.leecheck;

import java.nio.charset.Charset;

/**
 * Created by LQ on 2018/9/14.
 * com.leecheck
 */
public final class Const {

    public final static String UTF_8_ENCODING = "UTF-8";

    public final static String DEFAULT_ENCODING = UTF_8_ENCODING;

    public final static Charset DEFAULT_CHARSET = Charset.forName(DEFAULT_ENCODING);

    public final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    public final static String DATE_FORMAT = "yyyy-MM-dd";

    public final static String TIME_FORMAT = "HH:mm:ss";

    public final static Long ROOT_NODE_ID = 1L;
    public final static Long ROOT_NODE_PARENTID = 0L;

    public final static String ROLE_ADMIN = "ROLE_ADMIN";

    public final static String ROLE_SUPER_ADMIN = "ROLE_SUPER_ADMIN";

    public final static String ROLE_USER = "ROLE_USER";


    public final static String LAYER_GROUP = "layerGroup";
    public final static String LAYER_TYPE = "layerType";
    public final static String LOG_TYPE = "logType";
    public final static String LOG_TYPE_ADMINLOG = "adminLog";

    public final static String FILE_TYPE_SQLBACKUP = "sql";

    public final static String MYSQL = "mysql";
    public final static String ORACLE = "oracle";


    public final static String AES_KEY = "leecheck";
}
