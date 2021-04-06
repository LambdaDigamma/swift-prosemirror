//
//  Parser.swift
//  
//
//  Created by Lennart Fischer on 06.04.21.
//

import Foundation

public class Parser {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = .defaultProseMirrorDecoder) {
        self.decoder = decoder
    }
    
    public func parse(_ input: String) throws -> Document {
        
        guard let data = input.data(using: .utf8) else {
            throw DecodingError.stringCouldNotBe
        }
        
        return try decoder.decode(Document.self, from: data)
    }
    
    public enum DecodingError: LocalizedError {
        case stringCouldNotBe
    }
    
}

extension JSONDecoder {
    static let defaultProseMirrorDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
