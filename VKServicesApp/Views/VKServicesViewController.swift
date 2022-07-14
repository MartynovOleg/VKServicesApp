//
//  VKServicesViewController.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//

import UIKit

class VKServicesViewController: UIViewController {

    var output: VKServicesViewOutput?
    var serviceData = [Service]()
    let table = UITableView()
    let identifier = "MyCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сервисы VK"
        table.rowHeight = 64
        table.frame = view.frame
        table.register(VKServicesTableViewCell.self, forCellReuseIdentifier: identifier)
        table.reloadData()
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
        output?.viewLoaded()
    }
}

extension VKServicesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? VKServicesTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: serviceData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(serviceData[indexPath.row].link, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(serviceData[indexPath.row].link)
        }
    }
}

extension VKServicesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serviceData.count
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

extension VKServicesViewController: VKServicesViewInput {

    func setupData(with data: [Service]) {
        serviceData = data
        table.reloadData()
    }
}
