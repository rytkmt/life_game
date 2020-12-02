module LifeGame
  module Job
    module Freeter
      class << self
        def name
          "フリーター"
        end
        def salary
          LifeGame::Dice.roll * 5000
        end
      end
    end

    module Programmer
      class << self
        def name
          "プログラマー"
        end
        def salary
          20_000
        end
      end
    end

    module Artist
      class << self
        def name
          "アーティスト"
        end
        def salary
          LifeGame::Dice.roll * 10_000
        end
      end
    end

    module Judgement
      class << self
        def name
          "裁判官"
        end
        def salary
          30_000
        end
      end
    end

    BECOMABLE_JOBS = [Programmer, Artist, Judgement].freeze
  end
end
