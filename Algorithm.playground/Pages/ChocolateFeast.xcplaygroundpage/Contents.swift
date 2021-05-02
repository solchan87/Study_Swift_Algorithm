import Foundation

// Complete the chocolateFeast function below.
func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
    var eatenChocolates: Int = n / c

    var packageCnt: Int = eatenChocolates

    while packageCnt >= m {
        print(packageCnt)
        let changeChocolates = packageCnt / m
        eatenChocolates += changeChocolates
        packageCnt -= (changeChocolates * m)
        packageCnt += changeChocolates
    }

    return eatenChocolates
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let ncmTemp = readLine() else { fatalError("Bad input") }
    let ncm = ncmTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(ncm[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let c = Int(ncm[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let m = Int(ncm[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = chocolateFeast(n: n, c: c, m: m)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
