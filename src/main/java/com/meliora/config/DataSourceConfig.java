/*
 *  Created by ZhongWenjie on 2017-10-02 19:00
 */

package com.meliora.config;

import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

@Configuration
@Import(DBConfigProperties.class)
public class DataSourceConfig {

    @Autowired
    private DBConfigProperties properties;

    @Bean(name = "dataSource")
    @Primary
    @Qualifier(value = "dataSource")
    DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl(
                String.format("jdbc:mysql://%s:%s/%s?" +
                                "zeroDateTimeBehavior=convertToNull&amp;useUnicode=true&amp;" +
                                "characterEncoding=UTF-8&amp;useOldAliasMetadataBehavior=true&useSSL=true",
                        properties.getIp(), properties.getPort(), properties.getName())
        );
        dataSource.setUsername(properties.getUsername());
        dataSource.setPassword(properties.getPassword());
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        return dataSource;
    }

    @Bean(name = "sqlserverDataSource")
    @Qualifier(value = "sqlserverDataSource")
    DataSource sqlserverDataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl(
                String.format("jdbc:sqlserver://%s:%s;DatabaseName=%s",
                        properties.getSync_ip(), properties.getSync_port(), properties.getSync_name())
        );
        dataSource.setUsername(properties.getSync_username());
        dataSource.setPassword(properties.getSync_password());
        dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return dataSource;
    }

}
