package org.openisles.website.config;

import org.h2.jdbcx.JdbcDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@Configuration
@EnableTransactionManagement
public class DatabaseConfig {

    @Bean
    public DataSource dataSource() {
        JdbcDataSource dataSource = new JdbcDataSource();

        dataSource.setUrl("jdbc:h2:mem:openisles.org;DB_CLOSE_DELAY=-1");
        // DB_CLOSE_DELAY = Nach dem Schließen der letzten Verbindung die Daten nicht wegwerfen,
        // sondern bis JVM-Ende behalten!

        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean localSessionFactoryBean() {
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(dataSource());
        localSessionFactoryBean.setPackagesToScan("org.openisles.website.domain");
        return localSessionFactoryBean;
    }

    @Bean
    public HibernateTransactionManager txManager() {
        return new HibernateTransactionManager(localSessionFactoryBean().getObject());
    }

    @PostConstruct
    public void seedDatabase() throws SQLException {
        Connection connection = dataSource().getConnection();
        Resource databaseScript = new ClassPathResource("database/database.sql");
        ScriptUtils.executeSqlScript(connection, databaseScript);
        connection.commit();
        connection.close();
    }

}
