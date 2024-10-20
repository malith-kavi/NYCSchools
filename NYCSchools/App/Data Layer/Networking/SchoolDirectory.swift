//
//  SchoolDirectory.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-20.
//

import Foundation

protocol SchoolAPILogic{
    func getSchools()
}

class SchoolAPI: SchoolAPILogic{
    private struct Constants {
        static let schoolListURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$$app_token=L1KwLSwm1yz1N7aWqFCF4dLmM"
    }
        
    func getSchools() {
        //ToDo: impliment me
        print(Constants.schoolListURL)
        print("impliment get School")
    }
}
