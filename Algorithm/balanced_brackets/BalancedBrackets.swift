import Foundation

// Complete the isBalanced function below.
func isBalanced(s: String) -> String {
    var stacks: [String] = []
    for str in s {
        if str == "[" || str == "(" || str == "{" {
            stacks.append(String(str))
        }else{
            if stacks.isEmpty {
                return "NO"
            }else {
                if stacks.last == "[" {
                    if str == "]" {
                        stacks.removeLast()
                    }else{
                        return "NO"
                    }
                }else if stacks.last == "(" {
                    if str == ")" {
                        stacks.removeLast()
                    }else{
                        return "NO"
                    }
                }else if stacks.last == "{" {
                    if str == "}" {
                        stacks.removeLast()
                    }else{
                        return "NO"
                    }
                }
            }
        }
    }
    if stacks.isEmpty {
        return "YES"
    }else {
        return "NO"
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = isBalanced(s: s)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

