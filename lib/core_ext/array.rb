class Array

  synonyms :empty?, :vacant?, :blank?, :void?
  antonyms :empty?, :present?, :populated?, :filled?, :occupied?, :assigned?

  def  sum
    inject{|acc,n| acc + n }
  end

  def rand
    self[Kernel.rand(self.size)]
  end
  synonyms :rand, :random, :any

end
