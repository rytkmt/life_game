module LifeGame
  class Map
    def initialize(size:, payday_interval: 5)
      jobs = Job::BECOMABLE_JOBS.dup
      @squares = size.times.map do |i|
        count = i + 1
        if count == 1
          StartSquare.new # 何もなし
        elsif count == size
          GoalSquare.new
        elsif count % 5 == 0
          PaydaySquare.new
        elsif job = jobs.shift
          JobSquare.new(job: job)
        else
          [PlusSquare, MinusSquare].sample
        end
      end
    end

    def [](index)
      @squares[index]
    end
  end
end
