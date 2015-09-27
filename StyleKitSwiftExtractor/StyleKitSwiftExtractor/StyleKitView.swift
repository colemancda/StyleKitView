//
//  StyleKitView.swift
//  StyleKitSwiftExtractor
//
//  Created by Alsey Coleman Miller on 6/9/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation

/** Extracts the canvas names from StyleKit source code (that conform to 'class func drawCanvasName(frame frame: CGRect, tintColor: UIColor)' pattern. */
public func ExtractCanvasNames(inputText: String) -> [String] {
    
    let pattern = "class func draw(\\w+)\\(frame frame: CGRect"
    
    let regularExpression = try! NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions())
    
    let inputTextRange = NSRange(location: 0, length: (inputText as NSString).length)
    
    let matches = regularExpression.matchesInString(inputText, options: NSMatchingOptions(), range: inputTextRange) 
    
    var names = [String]()
    
    for result in matches {
        
        let canvasNameRange = result.rangeAtIndex(1)
        
        let canvasName = (inputText as NSString).substringWithRange(canvasNameRange)
        
        names.append(canvasName)
    }
    
    return names
}

/** Generates Swift source code from Canvas Names. */
public func GenerateStyleKitViewSourceCode(canvasNames: [String]) -> String {
    
    // No Style Kit Found
    if canvasNames.count == 0 {
        
        return "// Compatible canvas names could not be extracted, StyleKitCanvas and StyleKitView and will not be generated."
    }
    
    // generate source code...
    
    var sourceCode = ""
    
    // for less code
    func sourcePrint(string: String) {
        
        sourceCode.appendLine(string)
    }
    
    // add enum
    sourcePrint(GenerateStyleKitCanvasSourceCode(canvasNames))
    
    sourcePrint("/** View for displaying PaintCode canvasses. */")
    sourcePrint("@IBDesignable public class StyleKitView: UIView {")
    sourcePrint("")
    sourcePrint("/** Name of the PaintCode canvas to be rendered. Raw value of StyleKitCanvas. */")
    sourcePrint("@IBInspectable public var canvasName: String = \"\" { didSet { self.setNeedsDisplay() }}")
    sourcePrint("")
    sourcePrint("public override func drawRect(rect: CGRect) {")
    sourcePrint("if let canvas = StyleKitCanvas(rawValue: self.canvasName) {")
    sourcePrint("switch canvas {")
    
    for canvas in canvasNames {
        
        sourcePrint("case .\(canvas): StyleKit.draw\(canvas)(frame: self.bounds, tintColor: self.tintColor)")
    }
    
    sourcePrint("}}}")
    
    sourcePrint("public override func prepareForInterfaceBuilder() {")
    sourcePrint("if StyleKitCanvas(rawValue: self.canvasName) == nil {\nself.backgroundColor = UIColor.grayColor()\n }")
    sourcePrint("}}")
    
    return sourceCode
}
