# frozen_string_literal: true

module Hiq
  # syllabization functionality
  module Syllabizable
    def syllables(word)
      word.downcase.scan(/[aeiouy]/).size - diphtongs(word) - triphtongs(word) - silent_e_count(word)
    end

    def diphtongs(word)
      word.downcase.scan(/(?:[^aeiouy]|^)([aeiouy][aeiouy])(?:[^aeiouy]|$)/).size
    end

    def triphtongs(word)
      word.downcase.scan(/(?:[^aeiouy]|^)([aeiouy][aeiouy][aeiouy])([^aeiouy]|$)/).size
    end

    def silent_e_count(word)
      return 0 if word == 'the'

      word.downcase[-1] == 'e' ? 1 : 0
    end
  end
end
