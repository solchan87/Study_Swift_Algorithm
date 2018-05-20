import Foundation

// Complete the countApplesAndOranges function below.
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {


}

guard let stTemp = readLine() else { fatalError("Bad input") }
let st = stTemp.split(separator: " ").map{ String($0) }

guard let s = Int(st[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let t = Int(st[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let abTemp = readLine() else { fatalError("Bad input") }
let ab = abTemp.split(separator: " ").map{ String($0) }

guard let a = Int(ab[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let b = Int(ab[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let appleTemp = readLine() else { fatalError("Bad input") }
let apple: [Int] = appleTemp.split(separator: " ").map {
    if let appleItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return appleItem
    } else { fatalError("Bad input") }
}

guard apple.count == m else { fatalError("Bad input") }

guard let orangeTemp = readLine() else { fatalError("Bad input") }
let orange: [Int] = orangeTemp.split(separator: " ").map {
    if let orangeItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return orangeItem
    } else { fatalError("Bad input") }
}

guard orange.count == n else { fatalError("Bad input") }

countApplesAndOranges(s: s, t: t, a: a, b: b, apple: apple, orange: orange)

