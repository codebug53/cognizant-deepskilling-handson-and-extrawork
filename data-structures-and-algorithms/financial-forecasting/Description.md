# Recursion

## What is Recursion?

**Recursion** is a programming technique in which a function calls itself to solve a problem. Instead of solving the entire problem at once, the function repeatedly breaks it down into smaller subproblems until it reaches a condition that can be solved directly. This terminating condition is known as the **base case**.

A recursive function generally consists of two parts:

1. **Base Case** – The stopping condition that prevents further recursive calls.
2. **Recursive Case** – The part where the function calls itself with a smaller or modified input.

```text
function recursiveFunction(input):
    if (base case)
        return answer

    return recursiveFunction(smaller_input)
```

---

## Why is the Base Case Important?

Every recursive call is stored in the **call stack**. The call stack keeps track of each active function call until it completes.

If a recursive function does **not** have a valid base case, or if the base case is never reached, the function continues calling itself indefinitely. Since the call stack has limited memory, it eventually becomes full, resulting in a **Stack Overflow** (or **StackOverflowError** in Java).

### Example

```java
void print() {
    print();
}
```

The above function continuously calls itself without ever stopping, causing a stack overflow.

---

## Space Complexity of Recursion

Each recursive call occupies memory in the call stack.

If a recursive function makes **n** nested calls before reaching the base case:

* **Time Complexity:** Depends on the algorithm.
* **Space Complexity:** O(n) due to the recursion stack.

For deep recursion, this additional memory usage can become significant.

---

# Optimizing Recursion Using Dynamic Programming

Many recursive algorithms repeatedly solve the **same subproblem** multiple times. This leads to unnecessary computations and poor performance.

**Dynamic Programming (DP)** is an optimization technique that eliminates these repeated calculations by storing previously computed results.

Instead of solving the same subproblem repeatedly, the algorithm checks whether the answer has already been computed.

If the answer exists, it is returned immediately without making another recursive call.

This technique is known as **Memoization**.

---

## Memoization

Memoization uses a **shared memory structure** (such as an array, hash map, or dictionary) that is accessible to all recursive calls.

The execution flow becomes:

1. Check whether the current problem has already been solved.
2. If yes, return the stored value.
3. Otherwise:

   * Solve the problem recursively.
   * Store the computed result.
   * Return the stored value.

This avoids redundant recursive calls and greatly improves efficiency.

### Pseudocode

```text
function solve(n):

    if n is already computed:
        return stored_answer

    if base case:
        return answer

    answer = solve(smaller_problem)

    store answer

    return answer
```

---

## Example: Fibonacci Numbers

### Normal Recursive Solution

```java
int fib(int n) {
    if (n <= 1)
        return n;

    return fib(n - 1) + fib(n - 2);
}
```

Here, many Fibonacci values are computed repeatedly.

For example:

```text
fib(5)
│
├── fib(4)
│   ├── fib(3)
│   └── fib(2)
│
└── fib(3)
```

Notice that `fib(3)` is calculated more than once.

---

### Memoized Recursive Solution

```java
int[] dp = new int[100];

int fib(int n) {

    if (n <= 1)
        return n;

    if (dp[n] != 0)
        return dp[n];

    dp[n] = fib(n - 1) + fib(n - 2);

    return dp[n];
}
```

Now each Fibonacci value is calculated only **once** and stored in the `dp` array. Any future request for the same value is answered directly from memory.

---

# Dynamic Programming Without Recursion (Tabulation)

Dynamic Programming can also eliminate recursion entirely.

Instead of making recursive calls, the solution starts from the smallest subproblems and builds the answer iteratively.

This approach is called **Tabulation** or **Bottom-Up Dynamic Programming**.

Example:

```java
int fib(int n) {

    int[] dp = new int[n + 1];

    dp[0] = 0;
    dp[1] = 1;

    for (int i = 2; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }

    return dp[n];
}
```

Advantages:

* No recursive calls.
* No recursion stack.
* Better memory efficiency.
* Avoids stack overflow.

---

# Recursion vs Dynamic Programming

| Feature              | Recursion               | Dynamic Programming                         |
| -------------------- | ----------------------- | ------------------------------------------- |
| Function calls       | Calls itself repeatedly | Uses stored results to avoid repeated work  |
| Stack usage          | Uses call stack         | Memoization uses stack; Tabulation does not |
| Repeated computation | Yes                     | No                                          |
| Space complexity     | O(n) stack              | O(n) memory (or less with optimization)     |
| Performance          | Can be slow             | Usually much faster                         |

---

# Key Points

* Recursion is the process of a function calling itself.
* Every recursive function must have a **base case** to terminate execution.
* Without a valid base case, recursion continues indefinitely and eventually causes a **Stack Overflow**.
* Recursive algorithms may solve the same subproblem multiple times, leading to inefficiency.
* **Dynamic Programming** optimizes recursion by storing previously computed results in a shared memory structure.
* **Memoization** reduces repeated recursive calls while retaining recursion.
* **Tabulation** eliminates recursion entirely by solving subproblems iteratively from the bottom up.
* Dynamic Programming significantly improves both the time efficiency and scalability of many recursive algorithms.
