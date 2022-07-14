//
//  ViewController.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let table = UITableView()
    let identifier = "MyCell"
    let exampleUrl = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json")!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сервисы VK"
        table.rowHeight = 64
        table.frame = view.frame
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: identifier)
        table.reloadData()
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        do {
            let jsonData = try Data(contentsOf: exampleUrl)
            let result = try JSONDecoder().decode(Object.self, from: jsonData)
            print(result)
            cell.titleLabel.text = "\(result.body.services[indexPath.row].name)"
            cell.subtitleLabel.text = "\(result.body.services[indexPath.row].description)"
            cell.iconImageView.setCustomImage(result.body.services[indexPath.row].icon_url)

//            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                UIApplication.shared.openURL(result.body.services[indexPath.row].link)
//            }
        } catch {
            print(error)
        }
        return cell
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
}

extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
