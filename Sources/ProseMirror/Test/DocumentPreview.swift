//
//  DocumentPreview.swift
//  
//
//  Created by Lennart Fischer on 23.05.21.
//

#if canImport(SwiftUI)

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
    
    static var parsed: Document? {
        let input = """
            {
            "type": "doc",
            "content": [
                {
                    "type": "headline",
                    "attrs": {
                        "level": 1
                    },
                    "content": [
                        {
                            "type": "text",
                            "text": "moers festival 2021"
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "type": "text",
                            "text": "Es geht an Pfingsten um nichts weniger als den Kampf um die Zukunft! Denn alles überziehende organische Ungeheuer crashen verstohlen unser gewohntes kulturelles Leben, stehlen unser soziales Miteinander. Und sie haben Kunst, Bildung und Kultur in Flammen gesetzt."
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "type": "text",
                            "text": "Bereits vor einem Jahr stachen wir in die wilde See, um die Utopie Moers vor den feuerspeienden Bestien zu beschützen. Genau genommen sind wir schon seit einem halben Jahrhundert in dieser Mission unterwegs - gemeinsam mit euch."
                        },
                        { "type": "hardBreak" },
                        { "type": "text", "text": "Hey, lasst und das doch mal feiern!" }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "type": "text",
                            "text": "Was in den 70ern als Revolte begann, entnazifizieren wollte, die Welt gerechter machen und positiv gestalten sollte, blieb über fünf Jahrzehnte ein magnetischer Ort für befreite Musik und Experimente, war beständig Avantgarde und bescherte zuverlüssig das Unerwartete."
                        }
                    ]
                },
                {
                    "type": "paragraph",
                    "content": [
                        {
                            "type": "text",
                            "text": "Zum Festivaljubiläum kommt es nun zur alles entscheidenen Auseinandersetzung um Zukunft und Vergangenheit. Moerphs und Pyrills zündeln und löschen im analogdigitalen Time Tunnel zwischen Spielorten, "
                        },
                        {
                            "type": "text",
                            "text": "Camping, veganem Würstchenstand",
                            "marks": [{ "type": "strike" }, { "type": "bold" }]
                        },
                        { "type": "text", "text": " und pandemischer Not. " },
                        { "type": "hardBreak" },
                        {
                            "type": "text",
                            "text": "Ihr wollt wissen, wo ihr da in Ruhe eure digitale Picknickdecke ausbreiten könnt? Hier findet ihr alle Infos zu Programm, "
                        },
                        {
                            "type": "text",
                            "text": "Tickets, Camping",
                            "marks": [{ "type": "strike" }]
                        },
                        { "type": "text", "text": " und vielem mehr." }
                    ]
                }
            ]
            }
            """
        
        do {
            let parser = Parser()
            let document = try parser.parse(input)
            
            return document
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    static var previews: some View {
        
        Group {
         
            DocumentPreview(document: Document(content: [
                .headline(NodeHeadline(content: [
                    .text(NodeText(text: "Headline 1")),
                ], attrs: NodeHeadline.HeadlineAttributes(level: 1))),
                .paragraph(NodeParagraph(content: [
                    .text(NodeText(text: "Here is a long paragraph which hopefully at some point spans more than one line. ")),
                    .text(NodeText(text: "And a bit more bold text.", marks: [.bold]))
                ])),
                .headline(NodeHeadline(content: [
                    .text(NodeText(text: "Headline 2")),
                ], attrs: NodeHeadline.HeadlineAttributes(level: 2))),
                .paragraph(NodeParagraph(content: [
                    .text(NodeText(text: "Das ist ein Test."))
                ])),
                .headline(NodeHeadline(content: [
                    .text(NodeText(text: "Headline 3")),
                ], attrs: NodeHeadline.HeadlineAttributes(level: 3))),
            ]))
            .padding()
            
            if let parsed = parsed {
                ScrollView {
                    DocumentPreview(document: parsed)
                        .padding()
                }
//                .background(Color.black)
//                .environment(\.colorScheme, .dark)
            }
            
        }
        
    }
}

#endif
