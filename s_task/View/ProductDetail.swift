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
    private var navigationBarColor = Color(red: 0.44, green: 0.71, blue: 0.29)
    private var lineButtonColor = Color(red: 0.94, green: 0.94, blue: 0.94)
    var images: ImageModel
    
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
                        .frame(width: 24, height: 24)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
            .background(navigationBarColor)
            GeometryReader { geometry in
                let padding: CGFloat = 20
                let width = abs(geometry.size.width - (padding * 2))
                VStack {
                    if viewModel.icon != nil {
                        HStack(alignment: .top) {
                            Image(uiImage: viewModel.icon!)
                                .resizable()
                                .frame(width: 32, height: 32)
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
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                            Text(images.description)
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                        .lineSpacing(3)
                        .frame(width: width, alignment: .leading)
                        
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
                            .frame(width: width, height: 36)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineButtonColor , lineWidth: 1)
                            )
                            
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .background(Color.white)
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.downloadData(id: images.id)
        }
        
    }
}
