//
//  WriteReviewVC.swift
//  SimpleTest
//
//  Created by IRFAN TRIHANDOKO on 04/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class WriteReviewVC: BaseController {
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var reviewField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUITest(views: [titleField, reviewField], idList: ["titleField", "reviewField"])
    }

    @IBAction func slideAction(_ sender: UISlider) {
        scoreLbl.textColor = slider.value > 5 ? UIColor.blueGeneration : UIColor.red
        slider.tintColor = slider.value > 5 ? UIColor.blueGeneration : UIColor.red
        scoreLbl.text = String(format: "%.0f", slider.value)
    }
    
    @IBAction func sendAction(_ sender: UIBarButtonItem) {
        if titleField.text?.isEmpty == true && reviewField.text.isEmpty == true {
            showAlert(title: "Ojo kesusu!", message: "You haven't experienced yet", button: "Close", action: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: Implement View Delegate
extension WriteReviewVC: UITextFieldDelegate, UIScrollViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
