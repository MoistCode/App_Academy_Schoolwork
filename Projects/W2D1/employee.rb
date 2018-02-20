
class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    if boss.nil?
      @boss = nil
    else
      @boss = Manager.show_managers[boss]
      @boss.add_employee(self)
    end
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end
