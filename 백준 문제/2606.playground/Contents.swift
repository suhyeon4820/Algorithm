import UIKit
//********************************
// 바이러스, 2606 - (하) DFS, BFS
//********************************
let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n+1)
for _ in 1...m {
    let t = readLine()!.split(separator: " ").map({Int($0)!})
    graph[t[0]].append(t[1])
    graph[t[1]].append(t[0])
}

for i in 1...n {
    graph[i].sort()
}
//for i in 0..<arr.count {
//    arr[i] = arr[i].sorted(by: {$0 < $1})
//}

var visited = [Bool](repeating: false, count: n+1)
var count = 0
func dfsFunc(here: Int) {
    visited[here] = true
    count += 1
    for next in graph[here] {
        if !visited[next] == true {
            dfsFunc(here: next)
        }
    }
}
dfsFunc(here: 1)
print(count-1)

