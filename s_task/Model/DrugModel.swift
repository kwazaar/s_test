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
