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
      (target_syllable_length - line.map { |word| syllables(word) }.sum).times do
        line << 'zen'
      end

      line
    end
  end
end
