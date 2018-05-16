import Foundation

/*
 * Complete the breakingRecords function below.
 */
func breakingRecords(score: [Int]) -> [Int] {
    /*
     * Write your code here.
     */

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
