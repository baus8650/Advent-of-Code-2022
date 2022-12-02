import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let split = content.components(separatedBy: "\n\n")
let calorieListStrings = split.map {
    $0.components(separatedBy: "\n")
}

var calorieListInts = calorieListStrings.map { master in
    master.map {
        if let i = Int($0) {
            return i
        } else {
            return 0
        }
    }
}

let sums = calorieListInts.map { calorieList in
    calorieList.reduce(0, +)
}

let sortedSums = sums.sorted(by: >)

let partOneAnswer = sortedSums.first!

let partTwoAnswer = Array(sortedSums[0...2]).reduce(0, +)

print("Part 1: \(partOneAnswer), and Part 2: \(partTwoAnswer)")
