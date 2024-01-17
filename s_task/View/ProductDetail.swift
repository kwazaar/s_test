//
//  ProductDetail.swift
//  s_task
//
//  Created by MaxOS on 16.01.2024.
//

import SwiftUI

struct ProductDetail: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = ProductDetailViewModel()
    var images: ImageModel
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(images: ImageModel) {
        self.images = images
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0.44, green: 0.71, blue: 0.29))
            VStack {
                if viewModel.data != nil {
                    HStack(alignment: .top) {
                        if viewModel.icon != nil {
                            Image(uiImage: viewModel.icon!)
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        Spacer()
                        Image(uiImage: viewModel.image!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: width / 3, alignment: .center)
                        Spacer()
                        Image("Image")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .padding()

                    VStack(alignment: .leading, spacing: 8) {
                        Text(images.title)
                            .font(.custom("SFProDisplay-Semibold", size: 20))
                        
                        Text(images.description)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    .frame(width: width - 40, alignment: .leading)
                }
                Button {
                    //
                } label: {
                    HStack {
                        Image("pin")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("ГДЕ КУПИТЬ")
                            .font(.system(size: 12, weight: .medium))
                    }
                    .frame(width: width - 40, height: 36)
                    .foregroundStyle(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 0.94, green: 0.94, blue: 0.94)  , lineWidth: 1)
                    )
                    
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.downloadData(id: images.id)
        }
        
    }
}
