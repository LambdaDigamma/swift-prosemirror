//
//  Node.swift
//  
//
//  Created by Lennart Fischer on 05.04.21.
//

import Foundation

public protocol NodeStructure: Decodable {
    
    var type: String { get set }
    
//    var content: [Node] { get set }
    
}
