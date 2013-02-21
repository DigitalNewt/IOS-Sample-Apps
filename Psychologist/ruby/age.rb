require 'connect'

if __FILE__ == $0
    cursor = @users.find({"age" => {"$gt" => 20}})

    while doc = cursor.each
        puts doc["last_name"]
    end
end
