//
//  LoginController.swift
//  App
//
//  Created by xiAo_Ju on 2019/7/16.
//

import Vapor
import Leaf
import Authentication

final class LoginController: RouteCollection {
    func boot(router: Router) throws {
        let routes = router.grouped("tt")

        routes.get("login", use: loginHandler)
        routes.post("login", use: loginPOSTHandler)
    }

    func loginHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("mylogin")
    }
    
    func loginPOSTHandler(_ req: Request) throws -> Future<Response> {
        return try req.content.decode(LoginData.self).flatMap(to: Response.self) { data in
            return User.authenticate(username: data.username, password: data.password, using: BCryptDigest(), on: req).map(to: Response.self) { authedUser in
                guard let user = authedUser else {
                    return req.redirect(to: "/vapor/login?error")
                }
                
                try req.authenticateSession(user)
                return req.redirect(to: "/vapor")
            }
        }
    }
}
