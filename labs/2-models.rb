# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

new_salesperson = Salesperson.new

new_salesperson["first_name"] = "Derek"
new_salesperson["last_name"] = "Jeter"
new_salesperson["email"] = "djeter@hotmail.com"

puts new_salesperson.inspect

new_salesperson.save
puts "There are #{Salesperson.all.count} sales people"

new_salesperson2 = Salesperson.new

new_salesperson2["first_name"] = "Alexander"
new_salesperson2["last_name"] = "Ovechkin"
new_salesperson2["email"] = "Ovi@hotmail.com"

puts new_salesperson2.inspect

new_salesperson2.save


# 3. write code to display how many salespeople rows are in the database

puts "There are #{Salesperson.all.count} sales people"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

ovi = Salesperson.find_by({"last_name" => "Ovechkin"})
puts ovi.inspect

ovi["email"] = "Ovi8@hotmail.com"
puts ovi["email"]
ovi.save  # in order to make sure the data table is updated

# CHALLENGE:
# 5. write code to display each salesperson's full name

jeter = Salesperson.find_by({"first_name" => "Derek", "last_name" => "Jeter"}) #can specify multiple characteristics
puts jeter.inspect

puts "Salespeople: #{Salesperson.all.count}"

# this is slow / not ideal plus we already know the # which may not be the case in reality
#puts jeter["first_name"] + " " + jeter["last_name"]
#puts ovi["first_name"] + " " + ovi["last_name"]

salespeople = Salesperson.all

for name in salespeople
    first_name = name["first_name"]
    last_name = name["last_name"]
    name = "#{first_name} #{last_name}"
    puts name
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
