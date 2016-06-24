# ASCII has 128 characters mapped onto by 0:127
# useful funtions: print, join, Char, string
str = ""
for i in 0:127
  str = join([str, Char(i)])
end
str
print(str) # finally my string of all 128 ASCII characters


typeof(str)
typeof("β")

# ideas
# 1. parse the phrase in separate characters, transform them and pull them back together
# 2. operate directly on the elements of the phrase, substituting them with the encrypted elements
Int(str[1])

function ceasartransform(x::Char, k::Int64) # x has to be of length 1, k ϶ 0:127 is one of the 128 transformations
  if Int(x) + k <= 127
    z = Int(x) + k
  else
    z = Int(x) + k - 127
  end
  Char(z)
end

function ceasarencode(phrase::ASCIIString, k::Int64)
  str = ""
  for j in 1:length(phrase)
    str = join([str, ceasartransform(phrase[j], k)])
  end
  str
end

function ceasarprint(phrase::ASCIIString)
  for k in 0:127
    ceasarencode(phrase, k)
    println(str)
  end
end



ceasarencode("my phrase", 0)