//
//  BaseViewController.swift
//  Peliculas
//
//  Created by Sara Francisco on 26/12/21.
//

import UIKit
import SwiftMessages

// MARK: - BaseViewController
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showError(error: ServiceError) {
        let view = MessageView.viewFromNib(layout: .statusLine)
        view.configureDropShadow()
        view.configureTheme(.error)
        view.configureContent(title: "Error", body: error.errorDescription ?? "Fallo")
        SwiftMessages.show(view: view)
    }
}

