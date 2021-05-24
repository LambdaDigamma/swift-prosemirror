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
            throw DecodingError.stringEncodingFailed
        }
        
        return try decoder.decode(Document.self, from: data)
    }
    
    public enum DecodingError: LocalizedError {
        case stringEncodingFailed
    }
    
}

extension JSONDecoder {
    static let defaultProseMirrorDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }()
}
