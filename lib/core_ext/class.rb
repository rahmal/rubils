class Class

  def synonyms method, *args
    args.each do |new_method|
      alias_method new_method, method
    end
  end

  def antonyms method, *args
    args.each do |new_method|
      class_eval "def #{new_method}; not #{method} end"
    end
  end

end
