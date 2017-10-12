require 'byebug'
class Array

  def my_uniq
    arr=[]
    self.each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end


  def two_sum
    arr=[]
    self.each_index do |i|
      (i+1...length).each do |j|
        arr << [i,j] if (self[i]+self[j])==0
      end
    end
    arr
  end
end


def my_transpose(arr)
  length=arr[0].length
   answer=Array.new(length){Array.new(length)}
  arr.each_index do |i|
    arr.each_index do |j|
      answer[i][j] = arr[j][i]
    end
  end
  answer
end

def stock_picker(arr)
  pair=[]
  amount=0
  arr.each_index do |i|
      (i+1...arr.length).each do |j|
        diff=arr[j]-arr[i]
        if diff>amount
          pair=[i,j]
          amount=diff
        end
    end
  end
  pair
end

class HanoiTowers

  def initialize
    @arr1=[3,2,1]
    @arr2=[]
    @arr3=[]
  end

  def play
    begin
      input=get_input
     valid_move?(get_input)


  end

  def move_disk( arr1, arr2)

    begin
    raise ArgumentError unless valid_move?(arr1,arr2)
  rescue
  end
  end

  def get_input
    puts "gimme your choice"

  end

  def won?
  end

  private
  def valid_move?(arr1,arr2)
    return false if arr2.last < arr1.last
    true
  end
end
