//
//  DataModel.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//

import Foundation

struct Object: Codable {
    var body: Body
    var status: Int
}

struct Body: Codable {
    var services: [Services]
}

struct Services: Codable {
    var name: String
    var description: String
    var link: URL
    var icon_url: String
}
