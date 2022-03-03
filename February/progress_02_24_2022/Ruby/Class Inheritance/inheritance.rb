class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss) 
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :subordinates
    def initialize(name, title, salary, boss, subordinates)
        @subordinates = subordinates
        super(name,title,salary,boss)
    end

    def bonus(multiplier)
        subordinates.sum do |employee| 
            if employee.instance_of?(Manager)
                employee.bonus(multiplier) + (employee.salary * multiplier) 
            else
                employee.bonus(multiplier)
            end
        end
    end
end