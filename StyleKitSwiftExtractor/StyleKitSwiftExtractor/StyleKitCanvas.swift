//
//  StyleKitCanvas.swift
//  StyleKitSwiftExtractor
//
//  Created by Alsey Coleman Miller on 6/9/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation

/** Generates StyleKitCanvas enumeration source code from canvas names. */
public func GenerateStyleKitCanvasSourceCode(canvasNames: [String]) -> String {
    
    var sourceCode = ""
    
    if canvasNames.count == 0 {
        
        return "// Will not generate StyleKitCanvas due to no compatible canvas names.\n"
    }
    
    // for shorter code
    func sourcePrint(string: String) {
        
        sourceCode.appendLine(string)
    }
    
    // create enum
    sourcePrint("/** PaintCode canvas name. */")
    sourcePrint("public enum StyleKitCanvas: String {")
    
    for canvas in canvasNames {
        
        sourcePrint("case \(canvas) = \"\(canvas)\"")
    }
    
    sourcePrint("}")
    
    return sourceCode
}