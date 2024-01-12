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
        case item = "item"
        case search = "index"
    }
    
    func fetchData<T: Decodable>(from url: APIURL, id: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        print("1")
        if let url = URL(string: "\(server)\(url)/?id=\(id)") {
            print(url)
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                let data = try! JSONDecoder().decode(T.self, from: data!)
                print("2")
                DispatchQueue.main.async {
                    completion(.success(data))
                }
                if let error = error {
                    print(error.localizedDescription)
                }
            }.resume()
            print("3")
        }
    }
    
}
