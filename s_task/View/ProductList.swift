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
    private var shadowColor = Color(red: 0.27, green: 0.29, blue: 0.31, opacity: 0.15)
    private var navigationBarColor = Color(red: 0.44, green: 0.71, blue: 0.29)
    
    private var columns: [GridItem] = [ GridItem(.fixed(UIScreen.main.bounds.width / 2.2)), GridItem(.fixed(UIScreen.main.bounds.width / 2.2))]
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Button {
                    //
                } label: {
                    Image(systemName: "chevron.left")
                        .frame(width: 24, height: 24)
                }
                Spacer()
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
                Button {
                    isShowAlert.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 24, height: 24)
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(navigationBarColor)
            if viewModel.productListModel.isEmpty {
                Spacer()
                Text("Элементы по вашему запросу")
                    .foregroundStyle(.gray)
            }
            Spacer()
            if !viewModel.titleImage.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.titleImage, id: \.self) { image in
                            
                            NavigationLink {
                                ProductDetail(images: image)
                            } label: {
                                ProductCell(image: image.image!, title: image.title, description: image.description)
                                    .padding(.vertical, 5)
                                    .shadow(color: shadowColor, radius: 3)
                            }
                            
                            
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color.white)
        .preferredColorScheme(.dark)
        .alert("Поиск по ключевому слову", isPresented: $isShowAlert, actions: {
            TextField("Введите слово...", text: $viewModel.text)
                .foregroundStyle(.black)
            HStack {
                Button("Отмена", role: .destructive) {
                    //
                }
                Button("Найти", role: .cancel) {
                    if viewModel.text == "" {
                        title = "Элементы по пустому запросу"
                    } else {
                        title = viewModel.text
                    }
                    viewModel.loadSearchList()
                }
            }
        })
    }
}

#Preview {
    ProductList()
}
