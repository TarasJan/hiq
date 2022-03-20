# frozen_string_literal: true

module Hiq
  # Haiku generating object
  class Haiku
    include Syllabizable

    attr_reader :words

    def initialize(words)
      @words = words.sort_by(&:size)
    end

    def to_s
      haiku_lines.map { |l| l.join(' ') }.join("\n")
    end

    private

    def haiku_lines
      WordChecker.validate!(words)

      [5, 7, 5].zip(line_templates).map do |syllabes, line|
        LineComposer.call(line, target_syllable_length: syllabes)
      end
    end

    def line_templates
      lines = [[], [], []]
      words.each do |word|
        lines.detect { |l| l.size == lines.map(&:size).min } << word
      end
      lines
    end
  end
end
