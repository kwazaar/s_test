//
//  ContentView.swift
//  s_task
//
//  Created by MaxOS on 11.01.2024.
//

import SwiftUI

struct ProductList: View {
    
    @ObservedObject var viewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            if let model = viewModel.productListModel {
                Text(model.name)
            }
                TextField("Search", text: $viewModel.text)
                Button {
                    viewModel.loadData()
                } label: {
                    Text("Search")
                }

        }
        .padding()
    }
}

#Preview {
    ProductList()
}
