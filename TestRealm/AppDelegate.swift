//
//  AppDelegate.swift
//  TestRealm
//
//  Created by Sergey Maslov on 21.08.2018.
//  Copyright © 2018 Sergey Maslov. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxRealm

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        print(Realm.Configuration.defaultConfiguration.fileURL ?? "Realm not found")

        let messages = [Message("hello"), Message("world")]

        Observable.from(optional: messages)
            .subscribe(Realm.rx.add())
            .dispose()

        return true
    }

}

final class Message: Object {
    @objc dynamic var key: String = NSUUID().uuidString
    @objc dynamic var text: String = ""

    convenience init(_ text: String) {
        self.init()
        self.text = text
    }

    override static func primaryKey() -> String? {
        return "key"
    }
}

