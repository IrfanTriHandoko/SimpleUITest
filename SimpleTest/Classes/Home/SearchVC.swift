//
//  SearchVC.swift
//  UnitTesting
//
//  Created by IRFAN TRIHANDOKO on 02/07/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit

class SearchVC: BaseController {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView?
    var list: [String]?
    var listTemp: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        configUITest(views: [searchField], idList: ["searchField"])
    }
    
    @IBAction func searchAction(_ sender: UITextField) {
        if sender.text?.isEmpty == false {
            listTemp = list?.filter({$0.lowercased().contains(sender.text?.lowercased() ?? "")})
        } else {
            listTemp = list
        }
        tableView?.reloadData()
    }
    
}

// MARK: - Configure View
extension SearchVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func configData() {
        list = ["Mirazur Dining Room - Menton, France", "Noma - Copenhgagen, Denmark", "Asador Etxebarri - Atxondo, Spain", "Gaggan - Bangkok, Thailand", "Geranium - Copenhagen, Denmark", "Central - Lima, Peru", "Mugaritz - San Sebastian, Spain", "Arpège - Paris, France", "Disfrutar - Barcelona, Spain", "Maido - Lima, Peru"].sorted(by: {$0 < $1})
        listTemp = list
    }
    
    func configView() {
        configData()
        tableView?.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTemp?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let name = listTemp?[indexPath.row].components(separatedBy: " - ") ?? [""]
        cell.nameLbl.text = name.first
        cell.placeLbl.text = name.last
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = listTemp?[indexPath.row].components(separatedBy: " - ") ?? [""]
        let showDetail = { [weak self] (action: UIAlertAction!) -> Void in
            guard let ws = self else { return }
            let vc = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DetailVC
            vc.title = name.first
            ws.navigationController?.pushViewController(vc, animated: true)
        }
        showAlert(title: "Open the Restaurant", message: "\(name.first ?? "")", button: "Open", action: showDetail)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

// MARK: - Config TextField Delegate
extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
}



