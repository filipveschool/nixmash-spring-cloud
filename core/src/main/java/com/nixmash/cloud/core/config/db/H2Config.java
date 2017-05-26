package com.nixmash.cloud.core.config.db;

import com.nixmash.cloud.core.enums.SpringProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.autoconfigure.orm.jpa.JpaProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Map;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Configuration
@Profile(SpringProfile.H2)
@PropertySource("classpath:/db/h2.properties")
public class H2Config {

    @Autowired
    private JpaProperties jpaProperties;

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
        return new JpaTransactionManager(emf);
    }

    @Bean(name = "entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(
            EntityManagerFactoryBuilder factory) {
        return factory.dataSource(dataSource())
                .packages("com.nixmash.blog.jpa")
                .properties(getVendorProperties(dataSource()))
                .build();
    }


    private Map<String, String> getVendorProperties(DataSource dataSource) {
        return jpaProperties.getHibernateProperties(dataSource);
    }

    @Bean
    public DatabasePopulator databasePopulator(DataSource dataSource) {
        ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
        populator.setContinueOnError(true);
        populator.setIgnoreFailedDrops(true);
        populator.addScripts(new ClassPathResource("/db/h2schema.sql"),
                new ClassPathResource("/db/h2data.sql"));
        try {
            populator.populate(dataSource.getConnection());
        } catch (SQLException ignored) {
        }
        return populator;
    }

}
