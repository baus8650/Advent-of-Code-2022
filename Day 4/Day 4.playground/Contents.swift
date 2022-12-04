import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var masterList = content.components(separatedBy: "\n")
masterList = masterList.dropLast()

let pairsList = masterList.map {
    $0.components(separatedBy: ",")
}

func isolatePairs(_ pairs: [String]) -> (String, String) {
    return (pairs.first!, pairs.last!)
}

func findRange(_ assignmentString: String) -> (Int, Int) {
    let intArray = assignmentString.components(separatedBy: "-")
    return (Int(intArray.first!)!, Int(intArray.last!)!)
}

func findLargestRange(_ rangeOne: (Int, Int), rangeTwo: (Int, Int)) -> Int {
    let arrayOne = rangeOne.0...rangeOne.1
    let arrayTwo = rangeTwo.0...rangeTwo.1
    let options = [arrayOne.count, arrayTwo.count]
    let sorted = options.sorted(by: >)
    return sorted.first!
}

func findSeparateRange(_ rangeOne: (Int, Int), rangeTwo: (Int, Int)) -> Int {
    let arrayOne = rangeOne.0...rangeOne.1
    let arrayTwo = rangeTwo.0...rangeTwo.1
    return arrayOne.count + arrayTwo.count
}

var completeOverlaps = 0
var overlaps = 0

pairsList.map { pairs in
    let isolatedPairs = isolatePairs(pairs)
    let rangeOne = findRange(isolatedPairs.0)
    let rangeTwo = findRange(isolatedPairs.1)
    let targetRange = findLargestRange(rangeOne, rangeTwo: rangeTwo)
    let separateRange = findSeparateRange(rangeOne, rangeTwo: rangeTwo)
    let shiftOne = Set(rangeOne.0...rangeOne.1)
    let shiftTwo = Set(rangeTwo.0...rangeTwo.1)
    let joined = shiftOne.union(shiftTwo)
    if joined.count == targetRange {
        completeOverlaps += 1
    }
    if joined.count < separateRange {
        overlaps += 1
    }
}

let answer = """
The answer to part one: \(completeOverlaps)
The answer to part two: \(overlaps)
"""

print(answer)
