package com.lucasian.nsjp.app

class User {
    String username
    String passwordHash
    String nombre
    
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
        nombre(nullable: true, blank: true)
    }
    static mapping = {
        table "app_user"
    }
}
