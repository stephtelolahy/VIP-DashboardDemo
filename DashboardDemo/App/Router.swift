//
//  Router.swift
//  SwinjectDemo
//
//  Created by Hugues Telolahy on 12/03/2023.
//

import UIKit

/// Implementing navigation with UIKit
struct Router {
    weak var source: UIViewController?
    let dependencies: ViewProvider
}
