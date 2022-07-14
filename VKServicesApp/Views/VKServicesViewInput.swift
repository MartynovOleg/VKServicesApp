//
//  VKServicesViewInput.swift
//  VKServicesApp
//
//  Created by mac on 14.07.2022.
//

import Foundation

protocol VKServicesViewInput: AnyObject {
    func setupData(with data: [Service])
}
