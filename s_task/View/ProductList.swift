//
//  ContentView.swift
//  s_task
//
//  Created by MaxOS on 11.01.2024.
//

import SwiftUI

struct ProductList: View {
    
    @ObservedObject var viewModel = ProductListViewModel()
    
    private var columns: [GridItem] = [ GridItem (.flexible(minimum: 0, maximum: UIScreen.main.bounds.height / 2)), GridItem (.flexible(minimum: 0, maximum: UIScreen.main.bounds.height / 2))]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $viewModel.text)
                Button {
                    viewModel.loadSearchList()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
            }
            Spacer()
            if !viewModel.productListModel.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.titleImage) { image in
                                ProductCell(image: image.image!, title: "Описание продукта")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProductList()
}
