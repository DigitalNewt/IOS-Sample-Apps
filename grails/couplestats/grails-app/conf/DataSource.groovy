environments {
    development {
        grails {
            mongo {
                dbCreate = "add-drop" // one of 'add', 'add-drop', 'update', 'validate', ''
                host = "127.0.0.1:27017"
                port = 27017
                databaseName = "devCoupleStats"
            }
        }
    }
    test {
        grails {
            mongo {
                dbCreate = "add-drop" // one of 'add', 'add-drop', 'update', 'validate', ''
                host = "127.0.0.1:27017"
                port = 27017
                databaseName = "testCoupleStats"
            }
        }
    }
    production {
        grails {
            mongo {
                dbCreate = "update" // one of 'add', 'add-drop', 'update', 'validate', ''
                host = "127.0.0.1:27017"
                port = 27017
                databaseName = "coupleStats"
            }
        }
    }
}