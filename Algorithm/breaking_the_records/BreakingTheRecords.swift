import Foundation

/*
 * Complete the breakingRecords function below.
 */
func breakingRecords(score: [Int]) -> [Int] {
    
    var highestScoreCount: Int = -1
    var lowestScoreCount: Int = -1
    
    var highestScore: Int!{
        didSet{
            highestScoreCount += 1
        }
    }
    var lowestScore: Int!{
        didSet{
            lowestScoreCount += 1
        }
    }
    
    for (index, point) in score.enumerated() {
        if index == 0 {
            highestScore = point
            lowestScore = point
        }
        if highestScore < point {
            highestScore = point
        }
        if lowestScore > point {
            lowestScore = point
        }
    }
    
    return [highestScoreCount, lowestScoreCount]

}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoreTemp = readLine() else { fatalError("Bad input") }
let score: [Int] = scoreTemp.split(separator: " ").map {
    if let scoreItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoreItem
    } else { fatalError("Bad input") }
}

guard score.count == n else { fatalError("Bad input") }

let result = breakingRecords(score: score)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
