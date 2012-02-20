require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

bm(12) do |test|
  test.report("normal:") do
    LOOP_COUNT.times do |x|
      y = x+1
    end
  end

  test.report("predefine:") do
    x=y=0
    LOOP_COUNT.times do |x|
      y = x+1
    end
  end
end
