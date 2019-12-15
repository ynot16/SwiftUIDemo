
a. 
```flow
st=>start: Publisher
e1=>end: Subscriber 1
e2=>end: Subscriber 2
e3=>end: Subscriber 3
op1=>operation: Operator 1
op2=>parallel: Operator 2
op3=>parallel: Operator 3
st(right)->op1(right)->op2
op2(path1, right)->op3
op2(path2, bottom)->e3
op3(path1, right)->e1
op3(path2, bottom)->e2
```

b.
```flow
st=>start: Publisher
e=>end: Operator
op1=>operation: Subscriber 1
op2=>operation: Publisher 2
op3=>operation: Subscriber 2
st(right)->op1(right)->op2(right)->op3(right)->e
```

c.
```flow
st=>start: Publisher
e=>end: Subscriber
para=>parallel: Operator 1
op1=>operation: Operator 2
op2=>operation: Operator 3
op3=>operation: Operator 4
st(right)->para
para(path1, bottom)->op1(right)->op3(right)->e
para(path2, right)->op2(right)->op3(right)->e
```

d.
```flow
st=>start: Subscriber
op1=>operation: Operator 1
op2=>operation: Operator 2
op3=>operation: Operator 3
e=>end: Publisher
st(right)->op1(right)->op2(right)->op3(right)->e
```

```sequence
Subscriber->Publisher: 1. 我想要订阅 - Publisher.subscribe
Publisher->Subscriber: 2. 收到你的订阅 - Subscriber.receive(subscription:)
Subscriber->Publisher: 3. 我想要接收若干个 output - Subscription.request(_:)
Publisher-->Subscriber: 4. 给你新的 output 事件 - Subscriber.receive(_:)
Note over Publisher,Subscriber: 5. 还有更多的 output 事件...Subscriber.receive(_:)
Publisher-->Subscriber: 6. 发布结束 - Subscriber.receive(completion:)
```
