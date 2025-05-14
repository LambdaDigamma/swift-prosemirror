<!-- <img src="https://banners.beyondco.de/swift-prosemirror.png?theme=light&packageManager=&packageName=lambdadigamma%2Fswift-prosemirror&pattern=architect&style=style_1&description=A+ProseMirror+schema+parser+and+renderer+written+in+Swift+using+SwiftUI+to+render+a+document&md=1&showWatermark=0&fontSize=100px&images=document-text"> -->

# ProseMirror

<p align="left">
<img src="https://img.shields.io/badge/platforms-iOS%2C%20macOS%2C%20watchOS%2C%20tvOS-lightgrey.svg">
<img alt="Swift" src="https://github.com/LambdaDigamma/swift-prosemirror/actions/workflows/swift.yml/badge.svg">
</p>

A native Swift implementation for parsing and rendering [ProseMirror](https://prosemirror.net/) schema documents using SwiftUI.

**Features** <br/>
📝 Parse ProseMirror schema into type-safe Swift models <br />
🎨 Render documents directly with SwiftUI (proof-of-concept)

## Installation

Install `swift-prosemirror` with Swift Package Manager

```swift
dependencies: [
    .package(name: "ProseMirror", url: "https://github.com/lambdadigamma/swift-prosemirror", .upToNextMajor(from: "0.0.1")),
    ...
]
```

## Documentation

Parsing ProseMirror schema with the build-in parser to retrieve a type-safe parsed document:

```swift
import ProseMirror

let proseMirrorInput = "..."

let parser = Parser()
let document = try parser.parse(proseMirrorInput)
```

You can render a document to a SwiftUI `View` using:

```swift
document.render()
```

### Currently Supported Elements

- Text
- Hard Break
- Paragraph
- Links
- Headline (Level 1 to 3)
- Blockquote
- Unordered List (disk and dash)

## Roadmap

- [ ] Support all default mark types
- [ ] Support links with actions
- [ ] Implement ability to customize styling
- [ ] Make it easily extendable
- [ ] Headlines in ordered and unordered lists

## Changelog

Please see `CHANGELOG.md` for more information what has changed recently.

## Contributing

Contributions are always welcome!

## License

swift-prosemirror is available under the MIT license. See the `LICENSE.md` file for more info.
