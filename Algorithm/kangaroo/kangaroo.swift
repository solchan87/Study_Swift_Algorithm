import Foundation

let inputCnt: Int = Int(readLine()!)!

for _ in 1...inputCnt{
	let input = readLine()!
	let arr = input.components(separatedBy: " ").map({ Int($0)! })
	print(arr)
}
