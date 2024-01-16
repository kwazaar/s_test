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
    var description: String

    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 5, alignment: .center)
                .padding(.vertical, 5)
            VStack() {
                Text(title)
                    .font(.system(size: 13))
                    .lineLimit(2)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 5)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 5)
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width / 2.3, height: UIScreen.main.bounds.height / 3, alignment: .center)
        .background(Color.white)
        .cornerRadius(13)
    }
}

#Preview {
    ProductList()
}
