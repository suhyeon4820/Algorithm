## DFS & BFS

### 1. DFS(Depth-First Search) 깊이 우선 탐색 - Stack

>recursively explore th graph, backtracking as necessary
>
>한 노드의 자식을 타고 끝까지 순회한 후, 다시 돌아와서 다른 형제들의 자식을 타고 내려가며 순회함

- 깊이 우선 탐색이라고도 부르며 그래프에서 **깊은 부분을 우선적으로 탐색하는 알고리즘**

  ​		<img src = "image\a02\dfs.gif">

  

- **스택 자료구조(혹은 재귀함수)를 이용**하며 구체적인 동작 과정은 다음과 같음

  1. 탐색 시작 노드를 스택에 삽입하고 방문 처리(방문 기준: 번호가 낮은 인접 노드부터)

  2. 스택의 최상단 노드에 방문하지 않은 인접한 노드가 하나라도 있으면 그 노드를 스택에 넣고 방문

  3. 더 이상 2번의 과정을 수행할 수 없을 때까지 반복

     <img src = "image\a02\01.png">
     
     ```swift
     let n = 4, m = 5, v = 1
     var graph = [[Int]](repeating: [Int](), count: n+1)
     graph[1].append(contentsOf: [2])
     graph[1].append(contentsOf: [3])
     graph[1].append(contentsOf: [4])
     graph[2].append(contentsOf: [4])
     graph[3].append(contentsOf: [4])
     
     var visited = [Bool](repeating: false, count: n+1)
     var dfsResult = String()
     
     func dfs(node here: Int) {
         // 현재 노드를 방문 처리
         visited[here] = true
         dfsResult += "\(here) "
         // 시작 노드에서 인접 노드가 있을 때까지 반복
         for next in graph[here] {
             // 노드를 방문한 적이 없다면
             if !visited[next] {
                 // 인접 노드는 재귀로 탐색
                 dfs(node: next)
             }
         }
     }
     dfs(node: v)
     print(dfsResult) // 1 2 4 3
     ```
     
     

### 2. BFS(Breadth-First Search) 너비 우선 탐색  - queue 

>한 단계씩 내려가면서, 해당 노드와 같은 레벨에 있는 노드들 (형제 노드들)을 먼저 순회함

- 너비 우선 탐색이라고도 부르며, 그래프에서 **가까운 노드부터 우선적으로 탐색**하는 알고리즘

  ​		<img src = "image\a02\bfs.gif">

- **큐 자료구조**를 이용하며, 구체적인 동작 과정은 다음과 같음

  1. 탐색 시작 노드를 큐에 삽입하고 방문 처리를 함
  2. 큐에서 노드를 꺼낸 뒤에 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리
  3. 더 이상 2번의 과정을 수행할 수 없을 때까지 반복

  ```swift
  var visited2 = [Bool](repeating: false, count: n+1)
  var bfsResult = String()
  
  var queue = [Int]()
  // 최초 시작 위치를 queue에 담음
  queue.append(v)
  // 최초 노드를 방문한 것으로 표시
  visited2[v] = true
  
  while !queue.isEmpty {
      // 큐에서 하나의 원소를 뽑아 출력
      let here  = queue.removeFirst()
      bfsResult += "\(here) "
      // here의 인접 노드를 가져옴
      for next in graph[here] {
          // next를 방문한 적이 없다면
          if !visited2[next] {
              // next를 방문했다고 표시
              visited2[next] = true
              queue.append(next)
          }
      }
  }
  print(bfsResult) // 1 2 3 4
  ```

  

