//
//  VKServicesAssembly.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//
//
import UIKit

class VKServicesAssembly {
    static func makeViewController() -> UIViewController {
        let viewController = VKServicesViewController()
        let presenter = VKServicesPresenter(view: viewController)
        viewController.output = presenter
        return viewController
    }
}
