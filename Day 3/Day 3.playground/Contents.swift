import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let characterDict = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8, "i": 9, "j": 10, "k": 11, "l": 12, "m": 13, "n": 14, "o": 15, "p": 16, "q": 17, "r": 18, "s": 19, "t": 20, "u": 21, "v": 22, "w": 23, "x": 24, "y": 25, "z": 26, "A": 27, "B": 28, "C": 29, "D": 30, "E": 31, "F": 32, "G": 33, "H": 34, "I": 35, "J": 36, "K": 37, "L": 38, "M": 39, "N": 40, "O": 41, "P": 42, "Q": 43, "R": 44, "S": 45, "T": 46, "U": 47, "V": 48, "W": 49, "X": 50, "Y": 51, "Z": 52]

var rucksacks = content.components(separatedBy: "\n")
rucksacks = rucksacks.dropLast()

func splitString(_ string: String) -> (Set<String>, Set<String>) {
    var characterArray = Array(string)
    let stringArray = characterArray.map { String($0) }
    let midPoint = stringArray.count / 2
    let setOne = Set(stringArray[0...midPoint-1])
    let setTwo = Set(stringArray[midPoint...stringArray.count-1])
    return (setOne, setTwo)
}

func intersection(between setOne: Set<String>, and setTwo: Set<String>) -> String {
    let intersection = setOne.intersection(setTwo)
    let intersectedString = intersection.first!
    return intersectedString
}

func groupArrays(_ rucksacks: [String]) -> [[String]] {
    return rucksacks.chunked(into: 3)
}

func findPartTwoIntersection(_ rucksacks: [String]) -> String {
    let setOne = Set(rucksacks[0])
    let setTwo = Set(rucksacks[1])
    let setThree = Set(rucksacks[2])
    let firstPass = setOne.intersection(setTwo)
    let finalPass = firstPass.intersection(setThree)
    return String(finalPass.first!)
}

func tabulateValue(_ string: String) -> Int {
    return characterDict[string]!
}

var partOneValue = 0
var partTwoValue = 0

let groupedRucksacks = groupArrays(rucksacks)

let _ = rucksacks.map {
    let split = splitString($0)
    let intersection = intersection(between: split.0, and: split.1)
    partOneValue += tabulateValue(intersection)
}

let _ = groupedRucksacks.map {
    let intersection = findPartTwoIntersection($0)
    partTwoValue += tabulateValue(intersection)
}

print("Part one: \(partOneValue)\nPart two: \(partTwoValue)")


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
