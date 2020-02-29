# channel等待

* 例子  

```go 
package main

import (
	"fmt"
)

type worker struct {
	in chan int
	done chan bool
}

func doWork(id int,
			c chan int , done chan bool)  {
	for n := range  c {
		fmt.Printf("work %d received %c \n",id ,n)
		//异步不阻塞
		go func() {done <- true }()
	}
}

func createWorker(id int) worker {
	w := worker{
		in:   make(chan int),
		done: make(chan bool),
	}
	go doWork(id,w.in,w.done)
	return w
}

func chanDemo()  {
	var workers [10] worker

	for i :=0; i<10 ;i++  {
		workers[i] = createWorker(i)
	}
	for i :=0; i<10 ;i++  {
		workers[i].in <- 'a'+i
	}
	for i :=0; i<10 ;i++  {
		workers[i].in <- 'A'+i
	}
	//完全准备好
	for _, worker := range workers {
		<- worker.done
		<- worker.done
	}
}

func main() {
	chanDemo()
}
```

* 使用WaitGroup来批量等待  

```go 
package main

import (
	"fmt"
	"sync"
)

type worker struct {
	in chan int
	wg * sync.WaitGroup
}

func doWork(id int,
			c chan int , wg *sync.WaitGroup)  {
	for n := range  c {
		fmt.Printf("work %d received %c \n",id ,n)
		wg.Done()
	}
}

func createWorker(id int, wg * sync.WaitGroup) worker {
	w := worker{
		in:   make(chan int),
		wg: wg,
	}
	go doWork(id,w.in,wg)
	return w
}

func chanDemo()  {
	var workers [10] worker
	var wg  sync.WaitGroup

	for i :=0; i<10 ;i++  {
		workers[i] = createWorker(i,&wg)
	}
	wg.Add(20)
	for i :=0; i<10 ;i++  {
		workers[i].in <- 'a'+i
	}
	for i :=0; i<10 ;i++  {
		workers[i].in <- 'A'+i
	}
	wg.Wait()
}

func main() {
	chanDemo()
}
```