class String

  def empty_with_strip?
    self.strip.length == 0
  end
  alias_method :empty_no_strip?, :empty?
  alias_method :empty?, :empty_with_strip?

  synonyms :empty?, :vacant?, :blank?, :void?
  antonyms :empty?, :populated?, :filled?, :occupied?, :assigned?

  def starts_with? str
    /^#{str}/ === self
  end

  def ends_with? str
   /#{str}$/ === self
  end

  def is_number?
    /^(\d?)+\.?\d+$/ === self
  end

  def nan?
    not is_number?
  end

  def to_b
    return true if /true|yes|1/i === self
    return false if /false|no|0/i === self
  end

  def profane?
    profane_words.detect { |profane_word| self.downcase.split.include?(profane_word) }
  end

  def astercize_profanity
    self.split.each{|word| word.gsub!(profanity_regexp){|match| ["*" * match.length].compact.join}}.join(' ')
  end

  def equal_ignore_case? other
    other.is_a?(self) && self.downcase == other.downcase
  end

  private

  def profane_words
    @@profane_words ||= fetch_profane_words
    @@profane_words
  end

  def profanity_regexp
    @@profanity_regexp ||= Regexp.new("^(#{profane_words.join('|')})$", Regexp::IGNORECASE)
    @@profanity_regexp
  end

  def fetch_profane_words
    words = []
    File.open("#{RAILS_ROOT}/resources/profane.txt", "r") do |file|
      while word = file.gets
        words << word.strip.downcase
      end
    end
    return words
  end
end

