require_relative "room"

class Hotel
    def initialize(name, room)
        @name = name
        @rooms = {}
        room.each do |name,capcity| 
            @rooms[name] = Room.new(capcity)
        end
    end

    def name
        @name.split.each{|word| word.capitalize!}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.keys.include?(room)
    end

    def check_in(guest,room)
        if !room_exists?(room)
            puts "sorry, room doesn't exist."
        else
            check_in = @rooms[room].add_occupant(guest)
            puts "check in successful" if check_in 
            puts "sorry, room is full" if !check_in
        end
    end

    def has_vacancy?
        @rooms.any?{|name,room| !room.full?}
    end

    def list_rooms
        @rooms.each do |name,room|
            puts name + ": " + room.available_space.to_s
        end
    end
end
