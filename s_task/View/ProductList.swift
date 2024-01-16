//
//  ContentView.swift
//  s_task
//
//  Created by MaxOS on 11.01.2024.
//

import SwiftUI

struct ProductList: View {
    
    @ObservedObject var viewModel = ProductListViewModel()
    @State var title = "Поиск"
    @State var isShowAlert = false
    
    private var columns: [GridItem] = [ GridItem(.fixed(UIScreen.main.bounds.width / 2.2)), GridItem(.fixed(UIScreen.main.bounds.width / 2.2))]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(title)
                Spacer()
                Button {
                    isShowAlert.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0.44, green: 0.71, blue: 0.29))
            Spacer()
            if !viewModel.productListModel.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.titleImage, id: \.self) { image in
                            
                            NavigationLink {
                                ProductDetail(model: image)
                            } label: {
                                ProductCell(image: image.image!, title: image.title, description: image.description)
                                .padding(.vertical, 5)
                                .shadow(radius: 3)
                            }

                            
                        }
                    }
                    .padding()
                }
            }
        }
        .alert("Поиск ", isPresented: $isShowAlert, actions: {
            TextField("Search", text: $viewModel.text)
            Button("Найти") {
                title = viewModel.text
                viewModel.loadSearchList()
            }
        })
    }
}

#Preview {
    ProductList()
}
