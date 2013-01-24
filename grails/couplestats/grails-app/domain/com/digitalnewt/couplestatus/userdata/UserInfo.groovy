package com.digitalnewt.couplestatus.userdata

import com.digitalnewt.couplestatus.secure.User

class UserInfo {

    String fullName
    String toString (){
        "${fullName}"
    }
    static belongsTo = [assignee: User]

    static constraints = {
    }
}
