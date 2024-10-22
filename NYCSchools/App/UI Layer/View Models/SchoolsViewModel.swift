//
//  SchoolsViewModel.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-21.
//

import Foundation
import Combine


class SchoolsViewModel {
    @Published private(set) var schools: [School] = []
    @Published private(set) var error: DataError? = nil
    
    private let apiService: SchoolAPILogic
    
    init(apiService: SchoolAPILogic = SchoolAPI()){
        self.apiService = apiService
    }
    
    func getSchools() {
        apiService.getSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                
            case .failure(let error):
                self?.error = error
                
            }
        }
    }
}
