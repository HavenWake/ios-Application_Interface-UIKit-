//
//  AppDelegate.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func createFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }
    
    func createGestureViewController() -> UINavigationController {
        let createGestureViewController = GestureViewController()
        createGestureViewController.title = "Жесты"
        createGestureViewController.tabBarItem = UITabBarItem(title: "Жесты", image: UIImage(systemName: "wand.and.stars"), tag: 2)
        return UINavigationController(rootViewController: createGestureViewController)
    }
    
    func createLogInViewController() -> UINavigationController {
        let logInViewController = LogInViewController()
        logInViewController.title = "Профиль"
        logInViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        return UINavigationController(rootViewController: logInViewController)
    }
    
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .white
        tabBarController.viewControllers = [createFeedViewController(), createLogInViewController(), createGestureViewController()]
        return tabBarController
    }
}

