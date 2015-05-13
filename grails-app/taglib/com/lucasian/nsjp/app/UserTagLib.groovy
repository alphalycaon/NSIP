package com.lucasian.nsjp.app

import com.lucasian.nsjp.app.User
import org.apache.shiro.SecurityUtils

class UserTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "user"

    def loggedInUser = { attrs, body ->
        def user = _currentUser()

        if (!user) return

        def prop = user[attrs.property]
        //prop = prop.substring(0,prop.indexOf(" ")) 
        
        if (prop) out << prop.encodeAsHTML()
    }

    def _currentUser() {

        def subject = SecurityUtils.subject

        if (!subject.getPrincipal()) return // No-one logged-in
        
        return User.findByUsername(subject.getPrincipal().toString())
    }

}