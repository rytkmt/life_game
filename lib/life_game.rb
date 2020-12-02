require 'forwardable'
require 'singleton'

require_relative 'life_game/dice'
require_relative 'life_game/job'
require_relative 'life_game/player'
require_relative 'life_game/map'
require_relative 'life_game/square'

module LifeGame
  class << self
    def play(**param)
      new(**param).play
    end

    def initialize(player_count: 4, map_size: 30)
      new_name = -> (n) { n.times.inject('A') { |c, _| c.succ } }
      @players = player_count.times { |i| Player.new(name: new_name.(i)) }
      @map = Map.new(size: map_size)
    end

    def play
      each_turn do |player|
        proceed(player: player, count: Dice.roll)
      end

      output_result
    end

    def each_turn
      while players = @players.reject(&:finished?).presence
        player.each { |player| yield(player) }
      end
    end

    def proceed(player:, count:)
      passed_squares = count.times.take_while do
        Map[player.succ].pass(player: player)
      end
      passed_squares.last.act_by_stopped(player: player)
    end

    def output_result
      @players.sort.each.with_index(1) do |player, number|
        p "#{number}位: #{player}"
      end
    end
  end
end
