//
//  SceneDelegate.swift
//  MoviesDB
//
//  Created by NoteROIT on 03/06/20.
//  Copyright © 2020 Notebook. All rights reserved.
//

import UIKit
import SwiftUI

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {



        if let windowScene = scene as? UIWindowScene {

            let internalWindow = UIWindow(windowScene: windowScene)

            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Storyboard", bundle: nil)
            let newViewcontroller:UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "mainTableViewController") as! MainTableViewController
            let navigationController = UINavigationController(rootViewController: newViewcontroller)
               internalWindow.rootViewController = navigationController
               self.window = internalWindow
               internalWindow.makeKeyAndVisible()
        }
    }
}
