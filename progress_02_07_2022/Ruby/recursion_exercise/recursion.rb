def sum_to(n)
    if n < 0
        return nil
    elsif n == 0
        return 0
    else
        return n + sum_to(n-1)
    end
end

def add_numbers(nums_array)
    if nums_array.empty?
        return nil
    elsif nums_array.length == 1
        return nums_array[0]
    else
        return nums_array[0] + add_numbers(nums_array[1..-1])
    end
end

def gamma_fnc(n)
    if n <= 0
        return nil
    elsif n == 1 || n == 2
        return 1
    else
        return (n-1) * gamma_fnc(n-1)
    end
end

def ice_cream_shop(flavors, favorite)
    if flavors.empty?
        return false
    else
        return true if flavors[0] == favorite
        return ice_cream_shop(flavors[1..-1],favorite)
    end
end

def reverse(string)
    if string.length <= 1
        return string
    else
        return reverse(string[1..-1]) + string[0]
    end
end

if __FILE__ == $PROGRAM_NAME
  puts "sum_to test:\n======"
  puts sum_to(5) == 15
  puts sum_to(1) == 1
  puts sum_to(9) == 45
  puts sum_to(-8) == nil
  puts "add_numbers test:\n======"
  puts add_numbers([1,2,3,4]) == 10
  puts add_numbers([3]) == 3
  puts add_numbers([-80,34,7]) == -39
  puts add_numbers([]) == nil
  puts "gamma_fnc test:\n======"
  puts gamma_fnc(0) == nil
  puts gamma_fnc(1) == 1
  puts gamma_fnc(4) == 6
  puts gamma_fnc(8) == 5040
  puts "ice_cream_shop test:\n======"
  puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  == false
  puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  == true
  puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  == false
  puts ice_cream_shop(['moose tracks'], 'moose tracks')  == true
  puts ice_cream_shop([], 'honey lavender')  == false
  puts "reverse test:\n======"
  puts reverse("house") == "esuoh"
  puts reverse("dog") == "god"
  puts reverse("atom") == "mota"
  puts reverse("q") == "q"
  puts reverse("id")  == "di"
  puts reverse("")  == ""
end