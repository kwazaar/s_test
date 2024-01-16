//
//  ProductListViewModel.swift
//  s_task
//
//  Created by MaxOS on 12.01.2024.
//

import Foundation
import Combine



class ProductListViewModel: ObservableObject {
    
    @Published var productListModel: [DrugModel] = []
    @Published var id : String = ""
    @Published var text: String = ""
    
//    @Published var model: DrugModel?
    @Published var titleImage: [ImageModel] = []
    @Published var title: String = ""
    @Published var urlAddress: String = ""
  
    
    func loadSearchList() {
        NetworkService.shared.fetchData(url: NetworkService.APIURL.search.rawValue, text: text) { (result: Result<[DrugModel], Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.productListModel = data
                    
                    for product in self.productListModel {
                        let imageCachingService = ImageCachingService()
                        imageCachingService.loadImage(address: product.image) { image in
                            if let image = image {
                                self.titleImage.append(ImageModel(id: product.id, image: image, title: product.name, description: product.description))
                            }
                        }
                    }
                    self.text = ""
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
//    func loadImage(id: Int, address: String) {
//        let imageCachingService = ImageCachingService()
//        imageCachingService.loadImage(address: urlAddress) { image in
//            if let image = image {
//                self.titleImage.append(ImageModel(id: id,image: image))
//            }
//        }
//    }
}
