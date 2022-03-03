require "employee"

class Startup
    
    attr_accessor :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def hire(name, title)
        raise 'Invalid title' if !valid_title?(title)
        employees << Employee.new(name,title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        emp_salary = @salaries[emp.title] 
        raise 'Not enough funding' if emp_salary > @funding
        emp.pay(emp_salary)
        @funding -= emp_salary
    end

    def payday
        @employees.each{|emp| pay_employee(emp)}
    end

    def average_salary
        sum = 0
        @employees.each{|emp| sum += @salaries[emp.title]}
        sum / @employees.length.to_f
    end

    def close
        @funding = 0
        @employees = []
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each{|title,wage| @salaries[title] = wage if !@salaries.has_key?(title)}
        startup.employees.each{|emp| employees << emp}
        startup.close
    end
end
