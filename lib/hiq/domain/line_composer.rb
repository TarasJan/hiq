# frozen_string_literal: true

module Hiq
  # service responsible for composing a single line of Haiku
  class LineComposer
    include Syllabizable

    attr_reader :line, :target_syllable_length

    def self.call(line, target_syllable_length:)
      new(line, target_syllable_length: target_syllable_length).call
    end

    def initialize(line, target_syllable_length:)
      @line = line
      @target_syllable_length = target_syllable_length
    end

    def call
      return line if syllable_gap_size.zero?

      filled_line
    end

    private

    def syllable_gap_size
      target_syllable_length - line.map { |word| syllables(word) }.sum
    end

    def filled_line
      return [fillers[target_syllable_length].sample] if line.empty?

      [interpolated_fillers[target_syllable_length][syllable_gap_size].gsub('X', line.first)]
    end

    def interpolated_fillers
      {
        5 => {
          1 => 'the X',
          2 => 'ghastly X',
          3 => 'shadow of X',
          4 => 'X of my joy fade'
        },
        7 => {
          1 => 'a X',
          2 => 'the pale X',
          3 => 'X in silence',
          4 => 'X ends the autumn',
          5 => 'A spark of X above',
          6 => 'the sad facade of X torn'
        }
      }
    end

    def fillers
      {
        5 => ['empty riverside', 'tears flow in the rain', 'cheerful summer\'s charm'],
        7 => ['the vain wind of summer blows', 'gentle breeze upon a mountain', 'a frog jumps into a well']
      }
    end
  end
end
