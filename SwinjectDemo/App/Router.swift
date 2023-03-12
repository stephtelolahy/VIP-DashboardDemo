//
//  Router.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit

/// Implementing UIKit navigation
struct Router {
    weak var current: UIViewController?
    let dependencies: ViewProvider
}
