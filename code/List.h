#ifndef __LIST_H__
#define __LIST_H__

namespace ds {

template <typename E> class List { // List ADT
private:
  void operator=(const List &) {} // Protect assignment
  List(const List &) {}           // Protect copy constructor
public:
  List() {}          // Default constructor
  virtual ~List() {} // Base destructor

  // Return: The number of elements in the list.
  virtual int size() const = 0;

  // Remove all items from the list.
  virtual void clear() = 0;

  // Append an element at the end of the list.
  // item: The element to be appended.
  virtual void append(const E &item) = 0;

  // Insert an element at a given position.
  // pos: The position of the element before which to insert
  // item: The element to be inserted
  virtual void insert(int pos, const E &item) = 0;

  // Remove and return the element at a given position.
  // pos: The position of the element to be removed
  // Return: the element that was removed.
  virtual E remove(int pos) = 0;

  // Return: The the element at a given position.
  virtual const E &get(int pos) const = 0;

  // Replace the element in the list with a new one
  // pos: The position of the element to be replaced
  // item: The new element
  virtual void set(int pos, const E &item) = 0;
};

} // namespace ds

#endif // __LIST_H__
