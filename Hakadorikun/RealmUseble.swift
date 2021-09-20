//
//  RealmUseble.swift
//  Pods
//
//  Created by 奥若菜 on 2021/06/12.
//

import Foundation
import RealmSwift

protocol RealmUsable {
    static var filePath: String { get }
    static var config: Realm.Configuration { get }
    static var schema: Realm.Configuration { get }
    static func createRealm() -> Realm?
    static func addFileURL(config: Realm.Configuration) -> Realm.Configuration
  }

  extension RealmUsable {
      static var config: Realm.Configuration {
          var c = schema
          c.fileURL = c.fileURL?
              .deletingLastPathComponent()
              .appendingPathComponent(filePath)
              .appendingPathExtension("realm")
          return c
      }

      static var schema: Realm.Configuration {
          return Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemeVersion in
              if oldSchemeVersion < 1 {

              }
          })
      

        func createRealm() -> Realm? {
          do {
              return try Realm(configuration: config)
          } catch let error as NSError {
              assertionFailure("realm error: \(error)")
              var config = self.config
              config.deleteRealmIfMigrationNeeded = true
              return try? Realm(configuration: config)
          }
      }

  }
  }
