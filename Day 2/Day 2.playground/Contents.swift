import UIKit

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let rockOpponent = "A"
let paperOpponent = "B"
let scissorsOpponent = "C"

let rockSelf = "X"
let paperSelf = "Y"
let scissorsSelf = "Z"

let dictatedLoss = "X"
let dictatedTie = "Y"
let dictatedWin = "Z"

let rock = 1
let paper = 2
let scissors = 3

let loss = 0
let tie = 3
let win = 6

var textSplit = content.components(separatedBy: "\n")
let rounds = textSplit.dropLast(1)

func separateCharacters(from string: String) -> (String, String) {
    return (String(string.first!), String(string.last!))
}

func playRoundPartOne(with round: (String, String)) -> Int {
    switch round {
    case (rockOpponent, rockSelf):
        return rock + tie
    case (rockOpponent, paperSelf):
        return paper + win
    case (rockOpponent, scissorsSelf):
        return scissors + loss
    case (paperOpponent, rockSelf):
        return rock + loss
    case (paperOpponent, paperSelf):
        return paper + tie
    case (paperOpponent, scissorsSelf):
        return scissors + win
    case (scissorsOpponent, rockSelf):
        return rock + win
    case (scissorsOpponent, paperSelf):
        return paper + loss
    case (scissorsOpponent, scissorsSelf):
        return scissors + tie
    default:
        return 0
    }
}

func playRoundPartTwo(with round: (String, String)) -> Int {
    switch round {
    case (rockOpponent, dictatedLoss):
        return scissors + loss
    case (rockOpponent, dictatedTie):
        return rock + tie
    case (rockOpponent, dictatedWin):
        return paper + win
    case (paperOpponent, dictatedLoss):
        return rock + loss
    case (paperOpponent, dictatedTie):
        return paper + tie
    case (paperOpponent, dictatedWin):
        return scissors + win
    case (scissorsOpponent, dictatedLoss):
        return paper + loss
    case (scissorsOpponent, dictatedTie):
        return scissors + tie
    case (scissorsOpponent, dictatedWin):
        return rock + win
    default:
        return 0
    }
}

var partOneTotal = 0
var partTwoTotal = 0

let _ = rounds.map {
    let round = separateCharacters(from: $0)
    partOneTotal += playRoundPartOne(with: round)
    partTwoTotal += playRoundPartTwo(with: round)
}

print("Here is the total for part one: \(partOneTotal)\n\nHere is the total for part two: \(partTwoTotal)")
