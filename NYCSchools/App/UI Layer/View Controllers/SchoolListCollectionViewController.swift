//
//  ViewController.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-20.
//

import UIKit
import Combine
import PureLayout

class SchoolListCollectionViewController: UIViewController {
    
    private let schoolsViewModel: SchoolsViewModel = SchoolsViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        schoolsViewModel.getSchools()
        
        let titleStr = "schools.title".localized()
        printContent("\(titleStr)")
    }
    
    private func setupCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: view.frame.size.width, height: Constants.cellHeight)
// 
        collectionViewLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout
        )
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
        collectionView.autoPinEdgesToSuperviewEdges()
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        //setup & customize flow layout
        collectionView.register(SchoolCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupBinders() {
        schoolsViewModel.$schools
            .receive(on: RunLoop.main)
            .sink { schools in
                    print("retrived \(schools.count) schools")
            }
            .store(in: &cancellables)
        
        schoolsViewModel.$error
            .receive(on: RunLoop.main)
            .sink { [weak self] error in
                if let error = error {
                    let alert = UIAlertController(title: "Error", message: "Could not be retrive schools: \(error.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self?.present(alert, animated: true)
                }
            }
            .store(in: &cancellables)
    }
}




