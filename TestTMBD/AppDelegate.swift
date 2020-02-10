//
//  AppDelegate.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/18/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import SQLite3
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var db: OpaquePointer?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil { return true }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        Database.shared.openDatabase()
    
        // MARK: Tela inicial - Lista Filmes Lançamentos
        
        let controller = storyboard.instantiateViewController(withIdentifier: "MoviesTableViewController") as! MoviesTableViewController
        let presenter = MoviesListPresenter(service: MoviesListService())
        controller.presenter = presenter
        presenter.atatchView(view: controller)
        let navigationController = UINavigationController(rootViewController: controller)
        
       
        
        // MARK: Tela Favoritos
        let database = Database.shared
        let favoriteController = storyboard.instantiateViewController(withIdentifier: "FavoritesTableViewController") as! FavoritesTableViewController
        let favoritePresenter = FavoritesPresenter(service: FavoritesService(database: database))
        favoriteController.presenter = favoritePresenter
        favoritePresenter.atachView(view: favoriteController)
        let favoriteNavigationController = UINavigationController(rootViewController: favoriteController)
        
      // MARK: TabBar
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, favoriteNavigationController]
        
        let item1 = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        navigationController.tabBarItem = item1
        favoriteNavigationController.tabBarItem = item2
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

