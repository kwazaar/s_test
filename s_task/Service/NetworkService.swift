//
//  NetworkService.swift
//  s_task
//
//  Created by MaxOS on 11.01.2024.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    private var server = "http://shans.d2.i-partner.ru/api/ppp/"
    
    enum APIURL: String {
        case item = "item/?id="
        case search = "index/?search="
    }
    
    func fetchData<T: Codable>(url: String, text: String, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = URL(string: "\(server)\(url)\(text)") {
            print(url)
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "InvalidData", code: 0, userInfo: nil)))
                    return
                }
                do {
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    print("Ошибка декодирования")
                    completion(.failure(error))
                }
            }.resume()
        }
    }
}
