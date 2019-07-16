//
//  LoginController.swift
//  App
//
//  Created by xiAo_Ju on 2019/7/16.
//

import Vapor

final class LoginController: RouteCollection {
    func boot(router: Router) throws {
        let routes = router.grouped("tt")

        routes.get("login", use: loginHandler)
    }
    
    func loginHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("mylogin")
    }
}
