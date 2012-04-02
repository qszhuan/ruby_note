
arr = [3.14, 12, "This is a string", ]
p arr

arr = %w( fred wilma barney betty great\ gazoo)
p arr

arr = %w( Hey!\tIt is now -#{Time.now}-)
p arr

arr = %W( Hey!\tIt is now -#{Time.now}-)
p arr
