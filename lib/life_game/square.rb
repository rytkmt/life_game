module LifeGame
  class Square
    # 通過した際に呼ばれる
    # @return [Boolean] falseを返却すれば強制停止
    def pass(player:)
      true
    end

    def act_by_stopped(player:)
      raise(NotImplementedError)
    end
  end

  class PlusSquare < Square
    def act_by_stopped(player:)
      player.money += ([1..5].sample * 2000)
    end
  end

  class MinusSquare < Square
    def act_by_stopped(player:)
      player.money -= ([1..3].sample * 1000)
    end
  end

  class JobSquare < Square
    def initialize(job:)
      @job = job
    end

    def act_by_stopped(player:)
      player.job = @job
    end
  end

  class PaydaySquare < Square
    def pass(player:)
      player.get_paid
      true
    end
    def act_by_stopped(player:)
      # 何もしない
    end
  end

  class StartSquare < Square; end

  class GoalSquare < Square
    BONUSES = [
      50_000,
      30_000,
      10_000
    ].freeze

    def initialize
      @goal_count = 0
    end

    def pass(player:)
      false
    end

    def act_by_stopped(player:)
      player.money += BONUSES[@goal_count]
      @goal_count += 1
    end
  end
end
