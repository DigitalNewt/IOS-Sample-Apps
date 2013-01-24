package com.digitalnewt.couplestatus.userdata

import com.digitalnewt.couplestatus.secure.User

class CoupleType {

    String typeName
    String marriedTo
    String toString (){
        "${typeName}"
    }

    static belongsTo = [assignee: User]

    static constraints = {
        typeName(blank: false, unique: true)
        marriedTo(blank: true)
    }
}
