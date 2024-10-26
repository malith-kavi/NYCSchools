//
//  SchoolSectionHeaderView.swift
//  NYCSchools
//
//  Created by Malith Kavinda on 2024-10-26.
//

import Foundation
import PureLayout
import UIKit

class SchoolSectionHeaderView: UICollectionReusableView {
    private struct Constants {
        static let edgeInsets = UIEdgeInsets(top: 5,
                                             left: 10,
                                             bottom: 5,
                                             right: 5)
    }
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(headerLabel)
        headerLabel.autoPinEdgesToSuperviewEdges(with: Constants.edgeInsets)
    }
}
