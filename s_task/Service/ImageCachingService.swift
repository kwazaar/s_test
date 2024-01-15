//
//  ImageCachingService.swift
//  s_task
//
//  Created by MaxOS on 15.01.2024.
//

import Foundation
import SwiftUI


class ImageCachingService: ObservableObject {
//    static let shared = ImageCachingService()
    
    @Published var image : UIImage?
    private var server = "http://shans.d2.i-partner.ru/"
    
    func loadImage(address: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "\(server)\(address)") else { return }
        let request = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            self.image = UIImage(data: cachedResponse.data)
            completion(self.image)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let cacheData = CachedURLResponse(response: response!, data: data)
            URLCache.shared.storeCachedResponse(cacheData, for: request)
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                completion(self.image)
            }
        }.resume()
        
    }
    
    
}
