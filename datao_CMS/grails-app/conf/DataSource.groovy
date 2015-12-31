dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "entdb"
    password = "dm6db+1de@v"
	autoreconnect = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:mysql://192.168.0.108:3306/operation_test"

			pooled = true
			properties {
				maxActive = -1
				maxIdle = 5
				minIdle = 2
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "SELECT 1"
			}
        }
		dataSource_entdomain {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:mysql://192.168.0.108:3306/ent_domain"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "entdb"
			password = "dm6db+1de@v"
			pooled = true
			properties {
				maxActive = -1
				maxIdle = 5
				minIdle = 2
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "SELECT 1"
			}
		}
		
		
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:mysql://192.168.0.108:3306/operation"

			pooled = true
			properties {
				maxActive = -1
				maxIdle = 5
				minIdle = 2
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "SELECT 1"
			}
        }
		dataSource_entdomain {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:mysql://118.192.65.91:3306/ent_domain"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "entdb"
			password = "dm6db+1de@v"
			pooled = true
			properties {
				maxActive = -1
				maxIdle = 5
				minIdle = 2
				initialSize = 5
				minEvictableIdleTimeMillis = 60000
				timeBetweenEvictionRunsMillis = 60000
				maxWait = 10000
				validationQuery = "SELECT 1"
			}
		}
    }
}
