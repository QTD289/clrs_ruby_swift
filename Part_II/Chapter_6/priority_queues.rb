# Priority queues
class PriorityQueues
  def parent(i)
    (i - 1) / 2
  end

  def left(i)
    2 * i + 1
  end

  def right(i)
    2 * i + 2
  end

  def max_heapify(ar, i)
    l = left(i)
    r = right(i)

    largest = if l < ar.size && ar[l] > ar[i]
                l
              else
                i
              end

    largest = r if r < ar.size && ar[r] > ar[largest]

    return ar if largest == i

    temp = ar[i]
    ar[i] = ar[largest]
    ar[largest] = temp
    max_heapify(ar, largest)
  end

  def heap_maximum(ar)
    ar[0]
  end

  def heap_extract_max(ar)
    raise if ar.empty?
    heap_size = ar.size
    max = ar[0]
    ar[0] = ar[heap_size - 1]

    heap_size -= 1
    max_heapify(ar.first(heap_size), 0)
    max
  end

  def heap_increase_key(ar, i, key)
    raise if key < ar[i]
    ar[i] = key

    while i > 0 && ar[parent(i)] < ar[i]
      temp = ar[parent(i)]
      ar[parent(i)] = ar[i]
      ar[i] = temp
      i = parent(i)
    end
  end

  def max_heap_insert(ar, key)
    heap_size = ar.size
    ar[heap_size] = -999_999_999 # minus infinity
    heap_increase_key(ar, heap_size, key)
  end
end
