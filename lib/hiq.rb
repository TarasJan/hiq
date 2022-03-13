# frozen_string_literal: true

require 'version'
require 'haiku'

module Hiq
  class WordLengthError < StandardError
  end

  class WordTooLongError < WordLengthError
    def failure_message
      "At least one of the words provided exceeds 7 syllables - haiku with such word is impossible"
    end
  end

  class WordsCompositionError < WordLengthError
    def failure_message
      "The words provided cannot meet the haiku composition requirement due to their length"
    end
  end

  class WordsTooLongError < WordLengthError
    def failure_message
      "Words provided exceed 22 syllables - haiku needs to be 22 syllables long"
    end
  end

  def self.haiku(words)
    Haiku.new(words).to_s
  end
end

