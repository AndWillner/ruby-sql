# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

#puts "There are #{Company.all.count} companies"
#AW - to run things in rails; rails runner code-along/2-models.rb

# 2. insert new rows in companies table

new_company = Company.new

puts new_company.inspect

new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https:://www.apple.com"

puts new_company.inspect

new_company.save
puts "There are #{Company.all.count} companies"

new_company2 = Company.new

new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2["url"] = "https:://www.amazon.com"

puts new_company2.inspect

new_company2.save

puts "There are #{Company.all.count} companies"

new_company3 = Company.new

new_company3["name"] = "Basecamp"
new_company3["city"] = "Chicago"
new_company3["state"] = "IL"
new_company3["url"] = "https:://www.basecamp.com"

puts new_company3.inspect

new_company3.save

puts "There are #{Company.all.count} companies"

new_company4 = Company.new

new_company4["name"] = "Meta"
new_company4["city"] = "Menlo Park"
new_company4["state"] = "CA"
new_company4["url"] = "https:://www.meta.com"

puts new_company4.inspect

new_company4.save

puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

cali_companies = Company.where({"state" => "CA"})
#puts cali_companies.inspect
puts "Cali companies: #{cali_companies.count}" #there are 2 Cali companies


# 4. query companies table to find single row for Apple

#apple = Company.where({"name" => "Apple"})
#puts apple.inspect #returns an array

#apple = Company.where({"name" => "Apple"})[0]
#puts apple.inspect #returns a more readible version

apple = Company.find_by({"name" => "Apple"})
puts apple.inspect

# 5. read a row's column value

apple_url = apple["url"] #pull specific info from an array
puts apple_url

# 6. update a row's column value

amazon = Company.find_by({"name" => "Amazon"})
amazon["url"] = "https://amazon.com"
puts amazon.inspect
amazon.save # to actually push the update to the url into the data table

# 7. delete a row

meta = Company.find_by({"name" => "Meta"})
meta.destroy  #syntax to delete a row; in this case, found the row by company name

puts "Cali companies: #{cali_companies.count}" #there is now 1 Cali company