Day.destroy_all

d1 = Day.create date: "2018/01/01", journal: "This the journal entry for the first of January", image: "https://source.unsplash.com/user/erondu/600x600"

d2 = Day.create date: "2018/01/02", journal: "This the journal entry for the Second of January", image: "https://source.unsplash.com/user/erondu/600x600"

d3 = Day.create date: "2018/01/03", journal: "This the journal entry for the Third of January", image: "https://source.unsplash.com/user/erondu/600x600"

puts "Created #{ Day.all.length } days."

# binding.pry

Note.destroy_all

n1 = Note.create title: "Note One", detail: "This is note one detail", image: "https://source.unsplash.com/user/erondu/600x600", day: d1

n2 = Note.create title: "Note Two", detail: "This is note two detail", image: "https://source.unsplash.com/user/erondu/600x600", day: d1

n3 = Note.create title: "Note Three", detail: "This is note three detail", image: "https://source.unsplash.com/user/erondu/600x600", day: d2

puts "Created #{ Note.all.length } notes."

Task.destroy_all

t1 = Task.create name: "Task One", description: "Take out the trash", importance: "Pretty damn important", day: d1

t2 = Task.create name: "Task Two", description: "Take out the trash", importance: "Move it", day: d1

t3 = Task.create name: "Task Three", description: "Scrap old pizza of the cieling", importance: "Dont worry about it", day: d2

puts "Created #{ Task.all.length } tasks."
