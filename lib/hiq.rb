# frozen_string_literal: true

require 'version'
require 'syllabizable'
require 'exceptions'
require 'domain/word_checker'
require 'domain/line_composer'
require 'haiku'

# haiku main module
module Hiq
  def self.haiku(*words)
    Haiku.new(words).to_s
  end
end
