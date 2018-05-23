import Foundation

// Complete the taumBday function below.
func taumBday(b: Int, w: Int, bc: Int, wc: Int, z: Int) -> Int {
    if bc > wc + z {
        return (b * (wc + z)) + (w * wc)
    }else if wc > bc + z {
        return (b * bc) + (w * (bc + z))
    }else {
        return (b * bc) + (w * wc)
    }

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let bwTemp = readLine() else { fatalError("Bad input") }
    let bw = bwTemp.split(separator: " ").map{ String($0) }

    guard let b = Int(bw[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let w = Int(bw[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let bcWczTemp = readLine() else { fatalError("Bad input") }
    let bcWcz = bcWczTemp.split(separator: " ").map{ String($0) }

    guard let bc = Int(bcWcz[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let wc = Int(bcWcz[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let z = Int(bcWcz[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = taumBday(b: b, w: w, bc: bc, wc: wc, z: z)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

