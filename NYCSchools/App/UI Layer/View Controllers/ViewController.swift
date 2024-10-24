////
////  ViewController.swift
////  NYCSchools
////
////  Created by Malith Kavinda on 2024-10-20.
////
//
//import UIKit
//import Combine
//
//class ViewController: UIViewController {
//    
//    private let schoolsViewModel: SchoolsViewModel = SchoolsViewModel()
//    private var cancellables = Set<AnyCancellable>()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupBinders()
//        schoolsViewModel.getSchools()
//        
//        let titleStr = "schools.title".localized()
//        printContent("\(titleStr)")
//    }
//    
//    private func setupBinders() {
//        schoolsViewModel.$schools
//            .receive(on: RunLoop.main)
//            .sink { schools in
//                    print("retrived \(schools.count) schools")
//            }
//            .store(in: &cancellables)
//        
//        schoolsViewModel.$error
//            .receive(on: RunLoop.main)
//            .sink { [weak self] error in
//                if let error = error {
//                    let alert = UIAlertController(title: "Error", message: "Could not be retrive schools: \(error.localizedDescription)", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "OK", style: .default)
//                    alert.addAction(action)
//                    self?.present(alert, animated: true)
//                }
//            }
//            .store(in: &cancellables)
//    }
//}
//
//
//
//
