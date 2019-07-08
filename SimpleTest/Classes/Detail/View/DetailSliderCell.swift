//
//  DetailHeaderSliderCell.swift
//  SimpleTest
//
//  Created by IRFAN TRIHANDOKO on 04/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

protocol DetailSliderDelegate {
    func write()
}

class DetailSliderCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    var delegate: DetailSliderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData() {
        scoreLbl.textColor = slider.value > 5 ? UIColor.blueGeneration : UIColor.red
        slider.tintColor = slider.value > 5 ? UIColor.blueGeneration : UIColor.red
        scoreLbl.text = "Average Rating: " + String(format: "%.0f", slider.value)
    }
    
    @IBAction func writeAction(_ sender: UIButton) {
        delegate?.write()
    }
    
}
