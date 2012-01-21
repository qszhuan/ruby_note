# -*- coding: utf-8 -*-
a = [1, "2", 3.44, 4,5,6,7 ]
puts a
puts a[0],a[2], a[43]


#从下标2开始的3个元素
puts a[2,3]

puts a[-3, 2]

#range, .. 包含结束位置， ... 不包含结束位置
puts a[1..2]
puts a[1...2]

#push : 尾部插入
#pop  : 尾部删除
#shift: 首部删除
#unshift: 首部插入
a.push "pushed in"
puts a
puts a.shift 
h = {
'dog' => 'wangwang',
'cat' => 'miaomiao',
'donkey' => 'era'
}

puts h.length
puts h
