# Product Search System

## Objective

The objective of this project is to implement and compare two searching algorithms—**Linear Search** and **Binary Search**—using an array of `Product` objects. The project demonstrates the practical application of searching techniques, object-oriented programming principles, and algorithm analysis.

---

# Asymptotic Notation

## What is Big O Notation?

Big O notation is a mathematical representation used to describe the time complexity of an algorithm. It measures how the execution time or the number of operations performed by an algorithm grows as the size of the input increases.

Big O focuses on the worst-case growth rate while ignoring constants and lower-order terms. It allows developers to compare different algorithms and determine which one scales better for large datasets.

### Common Time Complexities

| Complexity | Description | Example |
|------------|-------------|---------|
| O(1) | Constant Time | Accessing an array element |
| O(log n) | Logarithmic Time | Binary Search |
| O(n) | Linear Time | Linear Search |
| O(n log n) | Linearithmic Time | Merge Sort |
| O(n²) | Quadratic Time | Bubble Sort |

---

# Search Operation Cases

The performance of a searching algorithm depends on where the target element is located.

## Best Case

The desired element is found immediately.

- **Linear Search:** The element is the first item in the array.
- **Binary Search:** The element is located at the middle index during the first comparison.

**Time Complexity:** `O(1)`

---

## Average Case

The desired element is found somewhere in the middle of the search process.

- **Linear Search:** Approximately half of the elements are examined.
- **Binary Search:** The search space is repeatedly divided in half until the element is found.

**Time Complexity**

- Linear Search: `O(n)`
- Binary Search: `O(log n)`

---

## Worst Case

The desired element is either the last element or does not exist in the collection.

- **Linear Search:** Every element must be checked.
- **Binary Search:** The search continues until the search space becomes empty.

**Time Complexity**

- Linear Search: `O(n)`
- Binary Search: `O(log n)`

---

# Product Class

The project defines a `Product` class containing the following attributes:

| Attribute | Description |
|-----------|-------------|
| `productId` | Unique identifier of the product |
| `productName` | Name of the product |
| `category` | Product category |

The class follows the principle of **Encapsulation** by keeping its fields private and providing controlled access through getter methods.

---

# Searching Algorithms

## Linear Search

Linear Search traverses the array sequentially until the desired product is found or the end of the array is reached.

### Algorithm

1. Start from the first element.
2. Compare each product's `productId` with the search key.
3. If a match is found, return the product.
4. Otherwise, continue until the array ends.
5. If no match is found, return `null`.

### Advantages

- Simple to implement.
- Works on both sorted and unsorted arrays.
- No preprocessing required.

### Disadvantages

- Inefficient for large datasets.
- Performance decreases as the array size increases.

### Time Complexity

| Case | Complexity |
|------|------------|
| Best | O(1) |
| Average | O(n) |
| Worst | O(n) |

---

## Binary Search

Binary Search repeatedly divides a **sorted array** into two halves until the target element is found.

### Algorithm

1. Sort the array using a comparator.
2. Find the middle element.
3. Compare the middle element with the target.
4. If equal, return the product.
5. If the target is smaller, search the left half.
6. Otherwise, search the right half.
7. Repeat until the element is found or the search space becomes empty.

### Advantages

- Very efficient for large datasets.
- Significantly fewer comparisons than Linear Search.

### Disadvantages

- Requires the array to be sorted.
- Additional preprocessing (sorting) is necessary.

### Time Complexity

| Case | Complexity |
|------|------------|
| Best | O(1) |
| Average | O(log n) |
| Worst | O(log n) |

---

# Comparator-Based Sorting

Binary Search requires the array to be sorted before searching. This project uses a custom `Comparator<Product>` implementation to sort products based on their `productId`.

Using a comparator provides the following benefits:

- Separates sorting logic from the `Product` class.
- Improves code reusability.
- Follows the **Open/Closed Principle (OCP)** by allowing different sorting criteria without modifying the `Product` class.

---

# Object-Oriented Design

The project follows several object-oriented design principles:

- **Encapsulation**: Product attributes are private and accessed through public getter methods.
- **Single Responsibility Principle (SRP)**: Each class has a single responsibility.
- **Open/Closed Principle (OCP)**: New search algorithms can be added without modifying existing code.
- **Strategy Pattern**: Linear Search and Binary Search are implemented as interchangeable search strategies.

---

# Time Complexity Comparison

| Algorithm | Best | Average | Worst | Requires Sorting |
|-----------|------|---------|-------|------------------|
| Linear Search | O(1) | O(n) | O(n) | No |
| Binary Search | O(1) | O(log n) | O(log n) | Yes |

---

# Conclusion

For small or unsorted collections, **Linear Search** is simple and effective. However, as the number of products increases, its linear time complexity becomes inefficient.

For large product catalogs, **Binary Search** is a better choice because it reduces the search time from **O(n)** to **O(log n)**. Although Binary Search requires the array to be sorted beforehand, its improved performance makes it the preferred algorithm for scalable applications such as e-commerce platforms and inventory management systems.