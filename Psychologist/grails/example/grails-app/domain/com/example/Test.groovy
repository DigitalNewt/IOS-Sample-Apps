package com.example

class Test {

    String title
    String author

    static constraints = {
        title blank: false, unique: true
        author blank: false, minSize: 5
    }

}
