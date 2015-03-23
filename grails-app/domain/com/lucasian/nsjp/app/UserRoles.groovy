package com.lucasian.nsjp.app

class UserRoles {
    int id
    int userId
    int roleId
    static mapping = {
        table "app_user_roles"
        id generator:'increment'
        version false
    }
    
    static constraints = {
    }
}
