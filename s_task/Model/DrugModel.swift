//
//  Item.swift
//  s_task
//
//  Created by MaxOS on 12.01.2024.
//

import Foundation

struct DrugModel: Codable, Identifiable {
    let id: Int
    let image: String
    let categories: Category
    let name: String
    let description: String
    let documentation: String?
    let fields: [Field]
}

struct Category: Codable {
    let id: Int
    let icon: String
    let image: String
    let name: String
}

struct Field: Codable {
    let types_id: Int
    let type: String
    let name: String
    let value: String?
    let image: String?
    let flags: Flags
    let show: Int
    let group: Int
}

struct Flags: Codable {
    let html: Int
    let no_value: Int
    let no_name: Int
    let no_image: Int
    let no_wrap: Int
    let no_wrap_name: Int
    let system: Int
}


//// MARK: - DrugModelElement
//struct DrugModelElement: Codable {
//    let id: Int
//    let image: String
//    let categories: Categories
//    let name, description, documentation: String
//    let fields: [Field]
//}
//
//// MARK: - Categories
//struct Categories: Codable {
//    let id: Int
//    let icon, image, name: String
//}
//
//// MARK: - Field
//struct Field: Codable {
//    let typesID: Int
//    let type: TypeEnum
//    let name, value: String
//    let image: String?
//    let flags: Flags
//    let show, group: Int
//
//    enum CodingKeys: String, CodingKey {
//        case typesID = "types_id"
//        case type, name, value, image, flags, show, group
//    }
//}
//
//// MARK: - Flags
//struct Flags: Codable {
//    let html, noValue, noName, noImage: Int
//    let noWrap, noWrapName, system: Int
//
//    enum CodingKeys: String, CodingKey {
//        case html
//        case noValue = "no_value"
//        case noName = "no_name"
//        case noImage = "no_image"
//        case noWrap = "no_wrap"
//        case noWrapName = "no_wrap_name"
//        case system
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case image = "image"
//    case list = "list"
//    case text = "text"
//}
//
//typealias DrugModel = [DrugModelElement]
