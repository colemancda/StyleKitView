# StyleKitView
Tool that generates a UIView subclass from your PaintCode generated StyleKit source code. Inspired by [R.swift](https://github.com/mac-cain13/R.swift) and a lack of NSInvocation in Swift.

## How it Works
The command line tool in this project will search the generated StyleKit Swift code for drawing functions matching the pattern ```func drawCanvasName(#frame: CGRect, tintColor: UIColor)```. Then it will create a a ```StyleKitCanvas``` enumeration and ```StyleKitView``` class.
