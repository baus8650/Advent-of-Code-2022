import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let stringArray = Array(content)

var partOneAnswer = 0
for i in 3..<stringArray.count {
    let startIndex = i-3
    let set = Set(stringArray[startIndex...i])
    if set.count == 4 {
        partOneAnswer = i+1
        break
    }
}

var partTwoAnswer = 0
for i in 13..<stringArray.count {
    let startIndex = i-13
    let set = Set(stringArray[startIndex...i])
    if set.count == 14 {
        partTwoAnswer = i+1
        break
    }
}

print("""
Part one: \(partOneAnswer)
Part two: \(partTwoAnswer)
""")
