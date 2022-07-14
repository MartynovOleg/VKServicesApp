
//  VKServicesPresenter.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//

import Foundation

class VKServicesPresenter {
    weak private var view: VKServicesViewInput?
    init(view: VKServicesViewInput) {
        self.view = view
    }
    private func getData() {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            return
        }
        let dataTask = session.dataTask(with: url) { data, response, error in
            do {
                let jsonData = try Data(contentsOf: url)
                let result = try JSONDecoder().decode(VKServicesDataResponse.self, from: jsonData)
                print (result)
                DispatchQueue.main.async {
                    self.view?.setupData(with: result.body.services)
                }
            } catch {
                print (error)
            }
        }.resume()
    }
}

extension VKServicesPresenter: VKServicesViewOutput {
    func viewLoaded() {
        getData()
    }
}
