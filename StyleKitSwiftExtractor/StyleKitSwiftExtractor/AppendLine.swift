//
//  AppendLine.swift
//  StyleKitSwiftExtractor
//
//  Created by Alsey Coleman Miller on 6/9/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

internal extension String {
    
    /** Appends the line to the string, always termanting with a return character. */
    mutating func appendLine(line: String) {
        
        self = self + line + "\n"
    }
}