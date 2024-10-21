//
//  SchoolDirectory.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-20.
//

import Foundation
import Alamofire

protocol SchoolAPILogic{
    func getSchools()
}

class SchoolAPI: SchoolAPILogic{
    private struct Constants {
        static let schoolListURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$$app_token=L1KwLSwm1yz1N7aWqFCF4dLmM"
    }
        
    func getSchools() {
        AF.request(Constants.schoolListURL)
            .validate()
            .responseDecodable(of: [School].self) { response in
                switch response.result {
                case .failure(let error):
                    break
                case .success(let school):
                    break
                }
            }
    }
    
    private func retrieveSchoolUsingStandardServices(){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "data.cityofnewyork.us"
        urlComponents.path = "/resource/s3k6-pzi2.json"
        urlComponents.queryItems = [URLQueryItem(name: "$$app_token", value: "L1KwLSwm1yz1N7aWqFCF4dLmM")]
        
        //another way to get URL
        //URL(string: schoolListURL)
        
        if let url = urlComponents.url{
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    print("error occured \(error)")
                    return
            }
                
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let schools = try decoder.decode([School].self,
                                                     from: data)
                    print("schools\(schools)")
                } catch let error {
                    print("error during passing\(error)")
                }
                
                    
                }
            }
            task.resume()
        }
    }
}
