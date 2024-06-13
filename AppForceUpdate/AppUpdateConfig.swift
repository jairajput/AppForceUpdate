//
//  AppUpdateConfig.swift
//  AppForceUpdate
//
//  Created by Jai  on 13/06/24.
//

import Foundation

struct AppUpdateConfig: Codable {
    var latestVersion: String
    var forceUpdateRequired: Bool
    var appStoreUrl: String
}

class AppUpdateManager {
    func checkAppUpdate(completion: @escaping (Bool, String) -> Void) {
        guard let path = Bundle.main.path(forResource: "app_version", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("Failed to load or parse the JSON file")
            completion(false, "")
            return
        }

        do {
            let jsonResponse = try JSONDecoder().decode(AppUpdateConfig.self, from: data)
            let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
            print("Current version: \(appVersion), Latest version: \(jsonResponse.latestVersion)")

            if jsonResponse.forceUpdateRequired && appVersion < jsonResponse.latestVersion {
                print("Update required")
                completion(true, jsonResponse.appStoreUrl)
            } else {
                print("No update required")
                completion(false, "")
            }
        } catch {
            print("Error parsing JSON: \(error)")
            completion(false, "")
        }
    }
}
