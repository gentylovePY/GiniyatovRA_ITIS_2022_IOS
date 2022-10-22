//
//  ViewController.swift
//  hw6
//
//  Created by Роман Гиниятов on 21.10.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    private let tableView: UITableView = .init(frame: .zero, style: .grouped)
    private let phoneAndroid:[Phone] = Data.getAndroidPhone()
    private let phoneApple:[Phone] = Data.getApplePhone()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    enum CellId : String{
        case android
        case apple
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell: UITableViewCell = .init()
            let phone = phoneAndroid[indexPath.row]

            if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: CellId.android.rawValue) {
                cell = dequeuedCell
            } else {
                cell = UITableViewCell(style: .value2, reuseIdentifier: CellId.apple.rawValue)
            }

            var configuration = UIListContentConfiguration.valueCell()
            configuration.text = "\(phone.nameCompany) \(phone.model)"

            if ("\(phone.nameCompany)" == "poco" ) {
                configuration.secondaryText = "size = \(phone.screenSize)"
                configuration.secondaryTextProperties.color = .black
            }

            configuration.image = UIImage(named: "\(phone.nameCompany)")
            configuration.imageProperties.maximumSize = CGSize(width: 50, height: 50)
            cell.contentConfiguration = configuration
            cell.selectionStyle = .none

            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell( withIdentifier: CellId.apple.rawValue, for: indexPath) as? CustomTableViewCell
            else {
                fatalError("err")
            }

            let phone = phoneApple[indexPath.row]
            cell.set(phone: phone)
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
                return phoneAndroid.count
                }
             return phoneApple.count
            }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "Android"
            } else{
                return "IOS"
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1) {
            tableView.deselectRow(at: indexPath, animated: true)
            print((tableView.cellForRow(at: indexPath) as? CustomTableViewCell)!.toString())
        }
    }
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Техника"
        setSubview(tableView)
        setConstraint()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId.android.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CellId.apple.rawValue)
  
    }
    
    private func setSubview(_ subview : UIView...){
        subview.forEach{view.addSubview($0)}
    }
    
    private func setConstraint(){
        setSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

