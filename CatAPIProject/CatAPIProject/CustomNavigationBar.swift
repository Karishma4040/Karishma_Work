//
//  CustomNavigationBar.swift
//  CatAPIProject
//
//  Created by Patil, Karishma Vikas on 24/10/24.
//

import SwiftUI

struct CustomNavigationBarTitle: UIViewControllerRepresentable {
    var title: String
    var fontSize: CGFloat
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let navigationController = uiViewController.navigationController {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: fontSize)
            ]
            navigationController.navigationBar.titleTextAttributes = attributes
            uiViewController.navigationItem.title = title
        }
    }
}
