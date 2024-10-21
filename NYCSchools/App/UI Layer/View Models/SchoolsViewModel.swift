//
//  SchoolsViewModel.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-21.
//

import Foundation


class SchoolsViewModel {
    private(set) var schools: [School] = []
    private(set) var error: DataError? = nil
    
    private let apiService: SchoolAPILogic = SchoolAPI()
    
    func getSchools(completion: @escaping(([School]?, DataError?) -> ())) {
        apiService.getSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools ?? []
                completion(schools, nil)
            case .failure(let error):
                self?.error = error
                completion([], error)
            }
        }
    }
}
