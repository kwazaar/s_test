//
//  ProductListViewModel.swift
//  s_task
//
//  Created by MaxOS on 12.01.2024.
//

import Foundation


class ProductListViewModel: ObservableObject {
    
    @Published var productListModel: DrugModel?
    @Published var id : String = ""
    @Published var text: String = ""
    
    func loadData() {
        
        NetworkService.shared.fetchData(from: .item, id: text, responseType: DrugModel.self) { result in
            switch result {
            case .success(let data):
                self.productListModel = data
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
