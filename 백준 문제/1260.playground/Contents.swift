import UIKit
import Foundation
import PlaygroundSupport
//********************************
// DFS와 BFS 1260 - (하) DFS, BFS
//********************************
/*
 - 정점 번호가 작은 것을 먼저 방문해야 함
 - 모든 노드와 간선을 차례대로 조회하여 O(N+M)의 시간 복잡도로 문제를 해결해야 함
 - 국내 코테 합격을 위해 이 문제를 매우 빠르게 풀 수 있도록 숙달할 필요가 있음
 - 큐 구현
 */

//let input = readLine()!.split{$0 == " "}.map{Int($0)!}
//let n = input[0], m = input[1], v = input[2]
//
//var graph = [[Int]](repeating: [Int](), count: n+1)
//
//for _ in 1...m {
//    let t = readLine()!.split{$0 == " "}.map{Int($0)!}
//    graph[t[0]].append(t[1])
//    graph[t[1]].append(t[0])
//}
//
//for i in 1...n {
//    graph[i].sort()
//}
//
//
//var visited = [Bool](repeating: false, count: n+1)
//var dfsResult = String()
//
//func dfs(node here: Int) {
//    // 현재 노드를 방문 처리
//    visited[here] = true
//    dfsResult += "\(here) "
//    // 시작 노드에서 인접 노드가 있을 때까지 반복
//    for next in graph[here] {
//        // 노드를 방문한 적이 없다면
//        if !visited[next] {
//            // 인접 노드는 재귀로 탐색
//            dfs(node: next)
//        }
//    }
//}
//dfs(node: v)
//print(dfsResult)
//
//var visited2 = [Bool](repeating: false, count: n+1)
//var bfsResult = String()
//
//var queue = [Int]()
//var head = 0
//// 최초 시작 위치를 queue에 담음
//queue.append(v)
//// 최초 노드를 방문한 것으로 표시
//visited2[v] = true
//var start: Int = v
//
//while !queue.isEmpty {
//    // 큐에서 하나의 원소를 뽑아 출력
//    let here  = queue.removeFirst()
//    bfsResult += "\(here) "
//    // here의 인접 노드를 가져옴
//    for next in graph[here] {
//        // next를 방문한 적이 없다면
//        if !visited2[next] {
//            // next를 방문했다고 표시
//            visited2[next] = true
//            queue.append(next)
//        }
//    }
//}
//print(bfsResult)

