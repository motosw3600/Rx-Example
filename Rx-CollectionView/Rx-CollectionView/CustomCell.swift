//
//  CustomCell.swift
//  Rx-CollectionView
//
//  Created by 박상우 on 2022/02/14.
//

import UIKit

class CustomCell: UICollectionViewCell {

    static let identifier = "CustomCell"
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemGray5
    }
    
    func setLabel(_ value: Int) {
        self.dataLabel.text = "\(value)"
    }
}
