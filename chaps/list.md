# 3. Lists

We define a **list** to be a finite, ordered sequence of data items known as **elements**.
"Ordered" in this definition means that each element has a **position** in the list.
Each list element has a data type.
In this chapter, we assume that all elements of the list have the **same** data type, although there is no conceptual objection to lists whose elements have differing data types if the application requires it.

A list is said to be **empty** when it contains no elements.
The number of elements stored in the list is called the **length** or **size** of the list.
The beginning of the list is called the **head**, the end of the list is called the **tail**.
Each element (except the head and the tail) has exactly one **predecessor** and one **successor** element in the list.

There might or might not be some relationship between the value of an element and its position in the list.
For example, **sorted lists** have their elements positioned in ascending order of value, while **unsorted lists** have no particular relationship between element values and positions.

We will use angle brackets ("$\langle$" and "$\rangle$") to denote a list and its content.
To be consistent with C++ array indexing, we will denote the first position on the list as $0$. If there are $n$ elements in the list, they are given positions $0$ through $n − 1$, as $\langle a_0, a_1, \ldots, a_{n−1}\rangle$. The subscript indicates an element's position within the list. Using this notation, the empty list would appear as $\langle \rangle$.

***Example:*** A polynomial in a single variable $x$ can always be written in the form
$$ a_0 + a_1 x + a_2 x^2 + \ldots + a_n x^n $$
