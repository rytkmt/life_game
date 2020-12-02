module LifeGame
  class Player
    extend Forwardable
    include Comparable
    attr_accessor :job, :money
    attr_reader :name

    def initialize(name:)
      @name = name
      @job = Job::Freeter
      @money = 3000
      @index = 0
      @finished = false
    end

    def succ
      @index += 1
    end

    def get_paid
      @money += job.salary
    end

    def goal
      @finished = true
    end

    def finished?
      @finished
    end

    def_delegator :@job, :name, :job_name

    def <=>(other)
      @money <=> other.money
    end

    def to_s
      "[#{@name}] #{money} yen"
    end
  end
end
