def h
  
 books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

books.sort_by do |hash|
  hash[:published].to_i
end
end


p h

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysees', author: 'James Joyce', published: '1922'}
# ]

# books.sort do |hash|
#   hash[:published].to_i
# end

# new_book = books.map do |h|
#   p h[:published].to_i
# end
# # p books[:published]
# p new_book.sort