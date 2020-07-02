package com.leecheck.dataSource;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.JdbcType;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.alibaba.druid.pool.DruidDataSource;
import com.baomidou.mybatisplus.MybatisConfiguration;
import com.baomidou.mybatisplus.entity.GlobalConfiguration;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.spring.MybatisSqlSessionFactoryBean;
import com.leecheck.Configuration.AutoFillHandler;

/**
 * Created by LQ on 2018/6/25.
 * i.lq.web.dataSource
 */
@Configuration
@MapperScan(basePackages = "com.leecheck.mapper.main", sqlSessionTemplateRef = "dsMainSqlSessionTemplate")
public class DsMainAutoConfiger {

    private static final Logger logger = LoggerFactory.getLogger(DsMainAutoConfiger.class);

    @Autowired
    private MultiDs dss;

    @Autowired
    private AutoFillHandler autoFillHandler;

    @Primary
    @Bean(name = "dsMainDataSource")
    public DataSource DataSource() {
        DruidDataSourceProperty ds = dss.getDss().get("dsmain");
        DruidDataSource druidDataSource = DsUtil.BuildDataSource(ds);
        logger.info("loadDatasource --->" + "dsMainDataSource");
        return druidDataSource;
    }

    @Bean(name = "dsMainSqlSessionFactory")
    @Primary
    public SqlSessionFactory SqlSessionFactory(@Qualifier("dsMainDataSource") DataSource dataSource, PaginationInterceptor paginationInterceptor) throws Exception {
        MybatisSqlSessionFactoryBean sqlSessionFactory = new MybatisSqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource);
        sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath*:/mapper/**/*Mapper.xml"));
        MybatisConfiguration configuration = new MybatisConfiguration();
        //configuration.setDefaultScriptingLanguage(MybatisXMLLanguageDriver.class);
        configuration.setJdbcTypeForNull(JdbcType.NULL);
        configuration.setMapUnderscoreToCamelCase(true);
        configuration.setCacheEnabled(false);
        configuration.addInterceptor(paginationInterceptor);
        sqlSessionFactory.setConfiguration(configuration);
        GlobalConfiguration conf = new GlobalConfiguration(new LogicSqlInjector());
        conf.setMetaObjectHandler(autoFillHandler);
        conf.setLogicDeleteValue("-1");
        conf.setLogicNotDeleteValue("1");
        conf.setIdType(0);
        //conf.setMetaObjectHandler(new MyMetaObjectHandler());
        conf.setDbColumnUnderline(true);
        conf.setRefresh(true);
        sqlSessionFactory.setGlobalConfig(conf);
        return sqlSessionFactory.getObject();
    }

    @Primary
    @Bean(name = "dsMainTransactionManager")
    public DataSourceTransactionManager annotationDrivenTransactionManager(@Qualifier("dsMainDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "dsMainSqlSessionTemplate")
    @Primary
    public SqlSessionTemplate SqlSessionTemplate(@Qualifier("dsMainSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean(name = "dsMainJdbcTemplate")
    public JdbcTemplate JdbcTemplate(@Qualifier("dsMainDataSource") DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }

}
