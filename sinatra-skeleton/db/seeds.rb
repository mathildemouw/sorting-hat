firstpost = Post.create!(title: "Test Post", content: "bloop bloop")
monkey = Post.create!(title: "Monkey Post", content: "ee ee oo oo")

Tag.create!(name: "Demo Tag 1")
Tag.create!(name: "Demo Tag 2")
Tag.create!(name: "Demo Tag 3")

monkey.tags << Tag.find(1)
monkey.tags << Tag.find(2)
monkey.tags << Tag.find(3)

firstpost.tags << Tag.find(1)
firstpost.tags << Tag.find(3)





# (1..5).each do |index|
#   aTag = Tag.create!(name:  "Demo Tag #{index}")
#   aTag.posts = Post.first
# end


# monkey.tags << Tag.find(1)
# monkey.tags << Tag.find(2)
# monkey.tags << Tag.create!(name: "Demo Tag 6")

