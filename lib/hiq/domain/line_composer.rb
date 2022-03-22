# frozen_string_literal: true

module Hiq
  # service responsible for composing a single line of Haiku
  class LineComposer
    include Syllabizable

    attr_reader :line, :target_syllable_length, :library

    def self.call(line, target_syllable_length:, library:)
      new(line, target_syllable_length: target_syllable_length, library: library).call
    end

    def initialize(line, target_syllable_length:, library:)
      @line = line
      @target_syllable_length = target_syllable_length
      @library = library
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
      return [library.get_const_filler(target_syllable_length)] if line.empty?

      [library.get_interpolated_filler(target_syllable_length, syllable_gap_size).gsub('X', line.first)]
    end
  end
end
