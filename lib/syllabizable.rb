# frozen_string_literal: true

module Hiq
  # syllabization functionality
  module Syllabizable
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
