/*
 *  Created by ZhongWenjie on 2017-10-03 18:00
 */

package com.meliora.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class DBConfigProperties {

    @Value("${db.ip}")
    private String ip;

    @Value("${db.port}")
    private String port;

    @Value("${db.name}")
    private String name;

    @Value("${db.username}")
    private String username;

    @Value("${db.password}")
    private String password;

    @Value("${sync.db.ip}")
    private String sync_ip;

    @Value("${sync.db.port}")
    private String sync_port;

    @Value("${sync.db.name}")
    private String sync_name;

    @Value("${sync.db.username}")
    private String sync_username;

    @Value("${sync.db.password}")
    private String sync_password;

}
