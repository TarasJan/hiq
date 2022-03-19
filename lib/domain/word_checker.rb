# frozen_string_literal: true

module Hiq
  # service for checking whether haiku can be constructed out of those words
  class WordChecker
    include Syllabizable

    attr_reader :words

    def self.validate!(words)
      new(words).validate!
    end

    def initialize(words)
      @words = words
    end

    def validate!
      ensure_word_length
      ensure_word_composition
    end

    private

    def ensure_word_composition
      raise WordsCompositionError if syllable_count.select { |count| count > 5 }.size > 1
      raise WordsCompositionError if syllable_count.select { |count| count == 5 }.size > 3
    end

    def ensure_word_length
      raise WordTooLongError if syllable_count.any? { |count| count > 7 }
      raise WordsTooLongError if syllable_count.sum > 22
    end

    def syllable_count
      @syllable_count ||= words.map { |word| syllables(word) }
    end
  end
end
