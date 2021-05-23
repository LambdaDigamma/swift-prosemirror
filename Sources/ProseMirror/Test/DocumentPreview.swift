//
//  DocumentPreview.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

import SwiftUI

public struct DocumentPreview: View {
    
    public let document: Document
    
    public init(document: Document) {
        self.document = document
    }
    
    public var body: some View {
        document.render()
    }
}

struct DocumentPreview_Previews: PreviewProvider {
    static var previews: some View {
        DocumentPreview(document: Document(content: [
            .paragraph(NodeParagraph(content: [
                .text(NodeText(text: "Here is a long paragraph which hopefully at some point spans more than one line. ")),
                .text(NodeText(text: "And a bit more bold text.", marks: [.bold]))
            ])),
            .paragraph(NodeParagraph(content: [
                .text(NodeText(text: "Das ist ein Test."))
            ]))
        ]))
    }
}
