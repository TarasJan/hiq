# frozen_string_literal: true

module Hiq
  class Haiku
    attr_reader :words

    def initialize(words)
      @words = words.sort_by(&:size)
    end

    def to_s
      check_words

      lines = [[], [], []]
      words.each do |word|
        lines.detect {|l| l.size == lines.map(&:size).min } << word
      end
      (7 - lines[0].map {|word| syllables(word) }.sum).times do
        lines[0] << 'zen'
      end
      (5 - lines[1].map {|word| syllables(word) }.sum).times do
        lines[1] << 'zen'
      end
      (5 - lines[2].map {|word| syllables(word) }.sum).times do
        lines[2] << 'zen'
      end
      lines.rotate!(2)
      lines.map {|l| l.join(" ") }.join("\n")
    end

    def check_words
      syllable_count = words.map { |word| syllables(word) }

      raise WordTooLongError if syllable_count.any? { |count| count > 7 }
      raise WordsCompositionError if syllable_count.select { |count| count > 5 }.size > 1
      raise WordsCompositionError if syllable_count.select { |count| count == 5 }.size > 3
      raise WordsTooLongError if syllable_count.sum > 22
    end

    private

    def syllables(word)
      word.downcase.scan(/[aeiouy]/).size - diphtongs(word) - triphtongs(word)
    end
  
    def diphtongs(word)
      word.downcase.scan(/[^aeiouy][aeiouy][aeiouy][^aeiouy]/).size
    end
  
    def triphtongs(word)
      word.downcase.scan(/[^aeiouy][aeiouy][aeiouy][aeiouy][^aeiouy]/).size
    end
  end
end
