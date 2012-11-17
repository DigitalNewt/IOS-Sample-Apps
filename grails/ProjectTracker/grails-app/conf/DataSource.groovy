
mongodb {
    host = "127.0.0.1:27017"
    port = 27017
    databasename = 'devDB'
}

mongodbsvt {
     host = "127.0.0.1:27017"
     port = 27017
     databasename = 'testDB'
}

mongodbprod {
    host = "127.0.0.1:27017"
    port = 27017
    databasename = 'prodDB'
}

environments {
    development {
        mongodb {
            dbCreate = "add-drop" // one of 'add', 'add-drop', 'update', 'validate', ''
        }
    }
    test {
        mongodbsvt {
            dbCreate = "add-drop" // one of 'add', 'add-drop', 'update', 'validate', ''
        }
    }
    production {
        mongodbprod {
            dbCreate = "update" // one of 'add', 'add-drop', 'update', 'validate', ''
        }
    }
}
