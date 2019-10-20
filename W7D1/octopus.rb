# testing
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
longest = "fiiiissshhhhhh"

def n2_octopus(arr)
    longest = ''
    arr.each do |ele|
        arr.each do |ele2|
            longest = ele if ele.length > ele2.length && ele.length > longest.length
        end
    end
    longest
end

# p n2_octopus(arr) == longest
require "byebug"
def nlogn_octopus(arr)
    return arr if arr.length <= 1
    #debugger
    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]
    sorted_left = nlogn_octopus(left)
    sorted_right = nlogn_octopus(right)
    sorted = merge(sorted_left,sorted_right)
    sorted[-1]
end

def merge(left,right)
    merged = []
    until left.empty? || right.empty?
        if left[0].length < right[0].length
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged.concat(right)
    merged.concat(left)
    merged
end

def clever_octopus(arr)
    longest = ''
    arr.each {|ele| longest = ele if ele.length > longest.length}
    longest
end

#p clever_octopus(arr) == longest

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir,arr)
    result = 0
    arr.each_index {|idx| result = idx if arr[idx] == dir}
    result
end

#p slow_dance("up", tiles_array) == 0
#p slow_dance("right-down", tiles_array) == 3

indices = (0..7).to_a
tiles_hash = Hash.new
(0..7).each {|idx| tiles_hash[tiles_array[idx]] = idx}

def fast_dance(dir,hash)
    hash[dir]
end

p fast_dance("up", tiles_hash) == 0
p fast_dance("right-down", tiles_hash) == 3