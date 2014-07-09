require 'pry'
require_relative 'BetaSV.rb'
require_relative 'ExponentialSV.rb'
require_relative 'NormalSV.rb'

@m = -3
@s = 4

@e_a = 0.5

@b_a = 2
@b_b = 4

def mathematical_expectation(arr)
  me = 0.0
  (arr.length).times do |i|
    me += arr[i]
  end
  me = me / arr.length.to_f
  me.round(4)
end

def dispersion(arr, me)
  disp = 0.0
  new_arr = []
  (arr.length).times do |i|
    new_arr << arr[i]**2
  end
  new_me = mathematical_expectation(new_arr)
  disp = new_me - me**2
  disp.round(4)
end

puts "--------------------"

nsv = NormalSV.new(@m, @s)
@me = mathematical_expectation(nsv.sv)
@disp = dispersion(nsv.sv, @me)

puts "Normal SV"
puts "norm me: #{nsv.me}"
puts "norm disp: #{nsv.disp}"
puts "me #{@me}"
puts "disp #{@disp}"

puts "--------------------"

exp_sv = ExponentialSV.new(@e_a)
@me = mathematical_expectation(exp_sv.sv)
@disp = dispersion(exp_sv.sv, @me)

puts "Exponential SV"
puts "exp me: #{exp_sv.me}"
puts "exp disp: #{exp_sv.disp}"
puts "me #{@me}"
puts "disp #{@disp}"

puts "--------------------"

beta_sv = BetaSV.new(@b_a, @b_b)
@me = mathematical_expectation(beta_sv.sv)
@disp = dispersion(beta_sv.sv, @me)

puts "Beta SV"
puts "beta me: #{beta_sv.me}"
puts "beta disp: #{beta_sv.disp}"
puts "me #{@me}"
puts "disp #{@disp}"

puts "--------------------"