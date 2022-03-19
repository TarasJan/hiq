# frozen_string_literal: true

module Hiq
  # Basic haiku error
  class WordLengthError < StandardError
  end

  # Exception for when one of the words is too long to fit into haiku
  class WordTooLongError < WordLengthError
    def failure_message
      'At least one of the words provided exceeds 7 syllables - haiku with such word is impossible'
    end
  end

  # Exception for when word composition is unattainable
  class WordsCompositionError < WordLengthError
    def failure_message
      'The words provided cannot meet the haiku composition requirement due to their length'
    end
  end

  # Exception for when too many syllables are provided by the user
  class WordsTooLongError < WordLengthError
    def failure_message
      'Words provided exceed 22 syllables - haiku needs to be 22 syllables long'
    end
  end
end
