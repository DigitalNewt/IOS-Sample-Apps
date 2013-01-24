
mongodb {
    host = "127.0.0.1:27017"
    port = 27017
    databaseName = 'devDB'
}

mongoprod {
    host = "127.0.0.1:27017"
    port = 27017
    databaseName = 'prodDB'
}

// environment specific settings
environments {
    development {
        mongodb {
            dbCreate = "add-drop" // one of 'add', 'add-drop', 'update', 'validate', ''
        }
    }

    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        mongoprod {
            dbCreate = "update" // one of 'add', 'add-drop', 'update', 'validate', ''
        }
    }
}
