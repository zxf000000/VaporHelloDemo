import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // "It works" page
    router.get { req in
        return try req.view().render("welcome")
    }
    
    // Says hello
    router.get("hello", String.parameter) { req -> Future<View> in
        return try req.view().render("hello", [
            "name": req.parameters.next(String.self)
        ])
    }
    let helloController = HelloController()
    router.get("greet", use: helloController.greet)

    router.get("users", Int.parameter) {req -> String in 
        let id = try req.parameters.next(Int.self)
        return "request id: \(id)"

    }


//    router.post("login") { req -> Future<HTTPStatus> in
//        return req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
//            print(loginRequest.email) // user@vapor.codes
//            print(loginRequest.password) // don't look!
//            return .ok
//        }
//    }
    // content Example
//    router.post("login") {req -> Future<HTTPStatus> in
//        return req.content.decode(LoginRequest.self).map(to: HTTPStatus.self) {loginRequest in
//            print(loginRequest.email)
//            print(loginRequest.password)
//            return .ok
//        }
//    }

}
