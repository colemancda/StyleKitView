# StyleKitView
Tool that generates a UIView subclass from your PaintCode generated StyleKit source code. Inspired by [R.swift](https://github.com/mac-cain13/R.swift) and a lack of NSInvocation in Swift.

## How it Works
The command line tool in this project will search the generated StyleKit Swift code for drawing functions matching the pattern ```func drawCanvasName(#frame: CGRect, tintColor: UIColor)```. Then it will create a a ```StyleKitCanvas``` enumeration and ```StyleKitView``` class.

## Installation

1. [Download](https://github.com/colemancda/StyleKitView/releases) a release, unzip it and put it into your source root directory
2. In XCode: Click on your project in the file list, choose your target under `TARGETS`, click the `Build Phases` tab and add a `New Run Script Phase` by clicking the little plus icon in the top left
3. Drag the new `Run Script` phase **above** the `Compile Sources` phase, expand it and paste the following script: `"$SRCROOT/rswift" "$SRCROOT"`
4. Build your project, in Finder you will now see a `StyleKitView.generated.swift` in the `$SRCROOT`-folder, drag the `StyleKitView.generated.swift` files into your project and **uncheck** `Copy items if needed`

_Tip:_ Add the `*.generated.swift` pattern to your `.gitignore` file to prevent unnecessary conflicts.
