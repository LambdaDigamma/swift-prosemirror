//
//  LinkHandler.swift
//  
//
//  Created by Lennart Fischer on 26.05.21.
//

import Foundation
import OSLog

public protocol LinkAttributes {
    
}

public protocol LinkHandler {
    
    func openLink(link: String, attrs: LinkAttributes)
    
}

#if canImport(UIKit)

import UIKit

/// The SafariOpener handles a link click by opening
/// the preferred system browser with the provided url.
/// It may fail when the `URL` cannot be created.
public class SafariOpener: LinkHandler {
    
    let logger = Logger(subsystem: "com.lambdadigamma.swift-prosemirror", category: "SafariOpener")
    
    public func openLink(link: String, attrs: LinkAttributes) {
        
        guard let url = URL(string: link) else {
            logger.error("URL could not be created: \(link)")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
}

#endif
