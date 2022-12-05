import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let separatedStrings = content.components(separatedBy: "\n\n")

var storageDictOne = [
    "1": ["W", "D", "G", "B", "H", "R", "V"],
    "2": ["J", "N", "G", "C", "R", "F"],
    "3": ["L", "S", "F", "H", "D", "N", "J"],
    "4": ["J", "D", "S", "V"],
    "5": ["S", "H", "D", "R", "Q", "W", "N", "V"],
    "6": ["P", "G", "H", "C", "M"],
    "7": ["F", "J", "B", "G", "L", "Z", "H", "C"],
    "8": ["S", "J", "R"],
    "9": ["L", "G", "S", "R", "B", "N", "V", "M"]
]

var storageDictTwo = storageDictOne

var instructionsArray = separatedStrings.last!.components(separatedBy: "\n")
let instructions = instructionsArray.dropLast()

func extractInstructions(_ string: String) -> [String] {
    return string.components(separatedBy: " ")
}

func moveSingleCrate(from: String, to: String, n: Int) {
    for _ in 0..<n {
        let crateInMotion = storageDictOne[from]!.popLast()
        storageDictOne[to]!.insert(crateInMotion!, at: storageDictOne[to]!.count)
    }
}

func moveGroupOfCrates(from: String, to: String, n: Int) {
    var tempArray = [String]()
    for _ in 0..<n {
        let crateInMotion = storageDictTwo[from]!.popLast()!
        tempArray.append(crateInMotion)
    }
    tempArray.reverse()
    storageDictTwo[to]!.append(contentsOf: tempArray)
}

func executePartOne(_ instructions: [String]) {
    let numberOfMoves = Int(instructions[1])!
    moveSingleCrate(from: instructions[3], to: instructions[5], n: numberOfMoves)
}

func executePartTwo(_ instructions: [String]) {
    let numberOfMoves = Int(instructions[1])!
    moveGroupOfCrates(from: instructions[3], to: instructions[5], n: numberOfMoves)
}

instructions.map {
    let extractedInstructions = extractInstructions($0)
    executePartTwo(extractedInstructions)
}

let finalOrientationPartOne = "\(storageDictOne["1"]!.last!)\(storageDictOne["2"]!.last!)\(storageDictOne["3"]!.last!)\(storageDictOne["4"]!.last!)\(storageDictOne["5"]!.last!)\(storageDictOne["6"]!.last!)\(storageDictOne["7"]!.last!)\(storageDictOne["8"]!.last!)\(storageDictOne["9"]!.last!)"

let finalOrientationPartTwo = "\(storageDictTwo["1"]!.last!)\(storageDictTwo["2"]!.last!)\(storageDictTwo["3"]!.last!)\(storageDictTwo["4"]!.last!)\(storageDictTwo["5"]!.last!)\(storageDictTwo["6"]!.last!)\(storageDictTwo["7"]!.last!)\(storageDictTwo["8"]!.last!)\(storageDictTwo["9"]!.last!)"

print("""
Part One: \(finalOrientationPartOne)
Part Two: \(finalOrientationPartTwo)
""")
