//
// Created by zhou xiaofei on 2019-06-28.
//

import Vapor
//import CBcrypt

final class HelloController {
    func greet(_ req: Request) throws -> String {
        return "Hello World"
//        return try req.make(BCryptHasher.self).hash("Hello")
    }
}
