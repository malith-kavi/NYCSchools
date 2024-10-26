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
    
    private struct Constants {
        static let cellIdentifier: String = "schoolCell"
        static let cellHeight: CGFloat = 100
        static let sectionHeaderIdentifier: String = "sectionHeader"
        static let sectionHeight:CGFloat = 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
            .sink { [weak self] schools in
                    if !schools.isEmpty {
                    print("retrived \(schools.count) schools")
                    self?.collectionView?.reloadData()
                }
                    
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

extension SchoolListCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schoolsViewModel.schools.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                            for: indexPath) as? SchoolCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let schoolSection = schoolsViewModel.schoolSectionsList[indexPath.section]
        let school = schoolsViewModel.schools[indexPath.item]
        cell.populate(school)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension SchoolListCollectionViewController: UICollectionViewDelegate {
    
}

