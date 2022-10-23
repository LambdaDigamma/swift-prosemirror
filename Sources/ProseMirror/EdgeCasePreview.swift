//
//  EdgeCasePreview.swift
//  
//
//  Created by Lennart Fischer on 23.10.22.
//

import SwiftUI

struct EdgeCase_Preview: PreviewProvider {
    
    static let document = Document(content: [
        .paragraph(NodeParagraph(content: [
            .text(NodeText(text: "Der realisierte SVS zeigt den tatsächlich erzielten SVS im Vergleich zum kostendeckenden (benötigten) SVS."))
        ]))
    ])
    
    static func parse() -> Document {
        
        let string = """
        {
        "type": "doc",
        "content": [
        {
        "type": "paragraph",
        "attrs": {
        "textAlign": "left"
        },
        "content": [
            {
              "type": "text",
              "marks": [
                {
                  "type": "bold"
                }
              ],
              "text": "Realisierter SVS: "
            }
            ]
            },
            {
            "type": "paragraph",
            "attrs": {
            "textAlign": "left"
            },
            "content": [
            {
              "type": "text",
              "text": "Der realisierte SVS zeigt den tatsächlich erzielten SVS im Vergleich zum kostendeckenden (benötigten) SVS."
            }
            ]
            },
            {
                "type": "paragraph",
                "attrs": {
                    "textAlign": "left"
                },
                "content": [
                    {
                      "type": "text",
                      "marks": [
                        {
                          "type": "bold"
                        },
                        {
                          "type": "italic"
                        }
                      ],
                      "text": "Formel:"
                    },
                    {
                      "type": "text",
                      "marks": [
                        {
                          "type": "italic"
                        }
                      ],
                      "text": " Rohertrag Dienstleistung Gesamt / Verkaufte Stunden Gesamt"
                    }
                ]
            }
        ]}
        """
        
        let decoder = JSONDecoder()
        
        return try! decoder.decode(Document.self, from: string.data(using: .utf8)!)
        
    }
    
    
    static var previews: some View {
        
        Self.parse()
            .padding()
        
    }
    
}
