# Heap sort
class HeapSort
  def self.sort(ar)
    build_max_heap(ar)
    heap_size = ar.size

    (ar.size - 1).downto(0) do |i|
      temp = ar[i]
      ar[i] = ar[0]
      ar[0] = temp

      heap_size -= 1
      ar_heap = max_heapify(ar.first(heap_size), 0)
      (0..ar_heap.size - 1).each do |j|
        ar[j] = ar_heap[j]
      end
    end
    ar
  end

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

  def build_max_heap(ar)
    ((ar.size - 1) / 2).downto(0) do |i|
      max_heapify(ar, i)
    end
  end

end
