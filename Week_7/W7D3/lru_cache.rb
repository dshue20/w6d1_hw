  require "byebug"
  class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      @cache << el
      @cache.delete_at(@cache.index(el)) if @cache[0...-1].include?(el)
      @cache.shift if self.count > @size
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    private
    # helper methods go here!
    attr_reader :size
    attr_accessor :cache

  end

  johnny_cache = LRUCache.new(4)
  #debugger
  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

  # We can convert the cache into a hash map, which will allow for insertion in O(1) time