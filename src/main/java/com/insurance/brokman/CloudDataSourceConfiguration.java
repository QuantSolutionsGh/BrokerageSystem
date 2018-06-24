package com.insurance.brokman;

import org.springframework.cloud.config.java.AbstractCloudConfig;
import org.springframework.cloud.service.PooledServiceConnectorConfig;
import org.springframework.cloud.service.relational.DataSourceConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

@Configuration
@Profile("cloud")
public  class CloudDataSourceConfiguration extends AbstractCloudConfig {

    @Bean
    public DataSource dataSource() {
        PooledServiceConnectorConfig.PoolConfig poolConfig = new PooledServiceConnectorConfig.PoolConfig(4, 4, 15000);
       // DataSourceConfig.ConnectionConfig connConfig = new DataSourceConfig.ConnectionConfig("removeAbandoned=true;removeAbandonedTimeout=10;abandonWhenPercentageFull=80");
        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put("removeAbandoned", "true");
        properties.put("removeAbandonedTimeout", 10);
        properties.put("abandonWhenPercentageFull", 80);
        DataSourceConfig dbConfig = new DataSourceConfig(poolConfig, null,properties);
        return connectionFactory().dataSource("brokeman",dbConfig);


    }
}
