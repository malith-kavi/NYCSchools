//
//  ViewController.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-20.
//

import UIKit

class ViewController: UIViewController {
    
    private let schoolViewModel: SchoolsViewModel = SchoolsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        schoolViewModel.getSchools()
        
//        let api: SchoolAPILogic = SchoolAPI()
//        api.getSchools { result in
//            switch result {
//            case .failure(let error):
//                print("error retrieving schools: \(error.localizedDescription)")
//            case .success(let schools):
//                if let schools = schools {
//                    print("found sschools \(schools.count)")
//                }
//            }
//        }
   }


}

