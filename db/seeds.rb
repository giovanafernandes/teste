# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# UserType.create({
# 	description: 'Admin'
# })
#
# UserType.create({
# 	description: 'Encarregado'
# })

# full access
# Access.create({
#     toCreate: true,
#     toRead: true,
#     toUpdate: true,
#     toDelete: true
# })

# full negative
# Access.create({
#     toCreate: false,
#     toRead: false,
#     toUpdate: false,
#     toDelete: false
# })

# can read, can create
# Access.create({
#     toCreate: true,
#     toRead: true,
#     toUpdate: false,
#     toDelete: false
# })

# can read, can update
# Access.create({
#     toCreate: false,
#     toRead: true,
#     toUpdate: true,
#     toDelete: false
# })

# can read, can delete
# Access.create({
#     toCreate: false,
#     toRead: true,
#     toUpdate: false,
#     toDelete: true
# })

# can read
# Access.create({
#     toCreate: false,
#     toRead: true,
#     toUpdate: false,
#     toDelete: false
# })

# can read, can create, can update
# Access.create({
#     toCreate: true,
#     toRead: true,
#     toUpdate: true,
#     toDelete: false
# })

# can read, can create, can delete
# Access.create({
#     toCreate: true,
#     toRead: true,
#     toUpdate: false,
#     toDelete: true
# })

# Job.create({
#     description: "Carpinteiro",
#     third: true,
#     salary: 1280.90
# })
#
# Job.create({
#     description: "Eletricista",
#     third: false,
#     salary: 2780.90
# })

Color.create({code: "#FFE599" })
Color.create({code: "#FFFFFF" })
Color.create({code: "#93C47D" })
Color.create({code: "#E06666" })
Color.create({code: "#3C78D8" })
Color.create({code: "#00FFFF" })
Color.create({code: "#9900FF" })
Color.create({code: "#F7981D" })
