module FunWithStrings
  def palindrome?
    str = self.downcase
    str = str.gsub(/[^a-z]/, '')
    str == str.reverse
  end
  
  def count_words
    str = self.downcase
    str = str.strip
    str = str.gsub(/[!.,-]/,'')
    words = str.split.reject { |w| w =~ /(\W|_|\d)/ }
    hash_words = Hash.new
    words.each do |word|
      hash_words[word] = words.count(word)
    end
    return hash_words
  end
  
  def anagram_groups
    words = self.split
    groups = Array.new
    until words.empty?
      word = words.first
      groups.push(words.select { |v| word.downcase.chars.sort.join.eql?(v.downcase.chars.sort.join)})
      words.delete_if{|v| word.downcase.chars.sort.join.eql?(v.downcase.chars.sort.join)}
    end
    return groups
  end
  
end

# make all the above functions available as instance methods on Strings:
class String
  include FunWithStrings
end



