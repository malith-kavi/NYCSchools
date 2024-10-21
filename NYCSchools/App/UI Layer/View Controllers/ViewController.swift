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
        schoolViewModel.getSchools { [weak self] (schools, error) in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "Could not be retrive schools: \(error.localizedDescription)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                self?.present(alert, animated: true)
            }
            
            if let schools = schools {
                print("retrived \(schools.count) schools")
            }
        }

   }


}

