//
//  Constant.swift
//  
//
//  Created by Lennart Fischer on 22.05.21.
//

import Foundation

public enum Content: Equatable {
    case headline(NodeHeadline)
    case text(NodeText)
    case paragraph(NodeParagraph)
    case bulletList(NodeBulletList)
    case listItem(NodeListItem)
}
