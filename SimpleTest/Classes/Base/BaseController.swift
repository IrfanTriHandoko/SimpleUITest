//
//  BaseController.swift
//  SimpleTest
//
//  Created by IRFAN TRIHANDOKO on 04/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(title: String, message: String, button: String, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: action))
        present(alert, animated: true, completion: nil)
    }

}


// MARK: - Config UITest
extension BaseController {
    
    func configUITest(views: [UIView], idList: [String]) {
        for i in 0..<views.count {
            views[i].accessibilityIdentifier = idList[i]
        }
    }
}
