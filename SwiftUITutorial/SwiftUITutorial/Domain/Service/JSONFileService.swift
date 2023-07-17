//
//  JSONFileService.swift
//  SwiftUITutorial
//
//  Created by Zeto on 2023/07/17.
//

import Foundation

struct JSONFileService {
    
    static func load(_ fileName: String) -> Data? {
        let data: Data
        
        guard let fileURL: URL = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            NSLog("Couldn't find \(fileName) in main bundle.")
            
            return nil
        }
        
        do {
            data = try .init(contentsOf: fileURL)
        } catch {
            NSLog("Couldn't load \(fileName) from main bundle:\n\(error)")
            
            return nil
        }
        
        return data
    }
}
