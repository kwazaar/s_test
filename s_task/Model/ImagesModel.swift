//
//  ImagesModel.swift
//  s_task
//
//  Created by MaxOS on 15.01.2024.
//

import Foundation
import SwiftUI


struct ImageModel: Identifiable, Hashable {
    
    var id: Int
    var image: UIImage?
    var title: String
    var description: String
    
}
