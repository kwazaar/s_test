//
//  ProductDetail.swift
//  s_task
//
//  Created by MaxOS on 16.01.2024.
//

import SwiftUI

struct ProductDetail: View {
    
    var model: ImageModel
    
    init(model: ImageModel) {
        self.model = model
    }
    
    var body: some View {
        Text(model.title)
    }
}

#Preview {
    ProductDetail(model: ImageModel(id: 3, title: "какое-то название ", description: "Какое-то описание и не понимаю зачем оно"))
}
