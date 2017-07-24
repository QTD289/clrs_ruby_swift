# Exercises for Chapter 5 - Sec 5.1
class Ex51
  class << self
    # Ex 5.1.2
    def rand_with_0_1(a, b)
      return a if a == b
      puts "#{a} - #{b}"
      m = (a + b) / 2
      if rand(2).zero?
        rand_with_0_1(a, m)
      else
        rand_with_0_1(m + 1, b)
      end
    end
    # End of 5.1.2

    # Ex 5.1.3
    # p = percent of 0s
    def biased_rand(p)
      return 1 if rand(101) - p > 0
      0
    end

    def equal_rand(p)
      x = biased_rand(p)
      y = biased_rand(p)

      return x if x != y
      equal_rand(p)
    end
    # End of 5.1.3
  end
end
