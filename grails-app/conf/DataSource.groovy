dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

// environment specific settings
environments {
    development {
        dataSource {
             dbCreate = "update"
                     username = "nsip"
                     password = "nsip"
                     driverClassName = "com.mysql.jdbc.Driver"
                     url = "jdbc:mysql://cloud.lucasianmexico.com:3307/nsip2"      
                     //url = "jdbc:mysql://192.168.1.11/nsip2"
                     properties { 
                            validationQuery="select 1" 
                            testWhileIdle=true 
                            timeBetweenEvictionRunsMillis=60000 
                     } 
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
             dbCreate = "update"
                     username = "nsip"
                     password = "nsip"
                     driverClassName = "com.mysql.jdbc.Driver"
                     //url = "jdbc:mysql://cloud.lucasianmexico.com:3307/nsip2"      
                     url = "jdbc:mysql://192.168.1.11/nsip2"
                     properties { 
                            validationQuery="select 1" 
                            testWhileIdle=true 
                            timeBetweenEvictionRunsMillis=60000 
                     }
        }
    }
}
