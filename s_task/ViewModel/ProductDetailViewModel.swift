//
//  ProductDetailViewModel.swift
//  s_task
//
//  Created by Максим Сизов on 17.01.2024.
//

import Foundation
import SwiftUI


class ProductDetailViewModel: ObservableObject {
    
    @Published var data: DrugModel?
    @Published var image: UIImage?
    @Published var icon: UIImage?
    
    func downloadData(id: Int) {
        NetworkService.shared.fetchData(url: NetworkService.APIURL.item.rawValue , text: String(id)) { (result: Result<DrugModel, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.data = data
                    let imageCachingService = ImageCachingService()
                    imageCachingService.loadImage(address: data.image) { image in
                        self.image = image
                    }
                    imageCachingService.loadImage(address: data.categories.icon) { icon in
                        self.icon = icon
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
