//
//  ProductCell.swift
//  s_task
//
//  Created by MaxOS on 15.01.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var image: UIImage
    var title: String
    
    
    
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
            Text(title)
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    ProductList()
}
