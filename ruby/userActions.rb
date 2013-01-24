require 'rubygems'
require 'mongo'

VIEW_PRODUCT = 0
ADD_TO_CART  = 1
CHECKOUT     = 2
PURCHASE     = 3

@con = Mongo::Connection.new
@db  = @con['garden']

@db.drop_collection("user.actions")
@db.create_collection("user.actions", :capped => true, :size => 1024)
@actions = @db['user.actions']

40.times do |n|
    doc = {
        :username =>"kbanker",
        :action_code => rand(4),
        :time => Time.now.utc,
        :n => n
    }

    @actions.insert(doc)
end
