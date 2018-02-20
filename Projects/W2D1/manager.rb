require_relative 'employee'
require 'byebug'

class Manager < Employee

  attr_reader :name, :title, :salary, :boss, :num_of_employees

  @@list_of_managers = {}

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @@list_of_managers[self.name] = self
    @num_of_employees = []
  end

  def self.show_managers
    @@list_of_managers
  end

  def bonus(multiplier)
    sum = 0
    @num_of_employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.sub_employee_salary
      else
        sum += employee.salary
      end
    end

    sum * multiplier
  end

  def add_employee(employee)
    @num_of_employees << employee
  end

  def sub_employee_salary
    sum = 0
    @num_of_employees.each do |employee|
      sum += employee.salary
    end
    sum + self.salary
  end

end
