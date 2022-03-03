require 'set'
class WordChainer

    attr_reader :dictionary, :current_words, :all_seen_words
    def initialize(dictionary_file_name)
        file = File.open("dictionary.txt")
        file_data = file.readlines.map(&:chomp)
        file.close
        @dictionary = file_data.to_set
        @current_words = []
        @all_seen_words = Hash.new
    end

    # Calls Helper method to get list of adjacent words
    def adjacent_words(word)
        @dictionary.select{|entry| word.adjacent(entry)}
    end

    def explore_current_words
        # Initializes current iteration of words to be empty
        new_current_words = []
        # Iterates through current possible selection of words
        @current_words.each do |current_word|
            # Iterates through all possible adjacent words for each current word
            self.adjacent_words(current_word).each do |adjacent_word|
                # Adds to list of candidates if adjacent word is not seen yet
                if !@all_seen_words.include?(adjacent_word)
                    new_current_words << adjacent_word
                    @all_seen_words[adjacent_word] = current_word
                end
            end
        end
        # Prints current iteration of words where key = new word and value = previous word
        # new_current_words.each{|new_word| puts "#{new_word} => #{@all_seen_words[new_word]}"}
        @current_words = new_current_words
    end

    def build_path(target)
        # Initialize build path to include target as destination
        path = [target]
        # Gets previous word to target
        search = @all_seen_words[target]
        # Halts iteration once previous word is not available (i.e. Source or Target is not seen)
        while !search.nil?
            # Add previous word to path, then search for next previous word
            path.unshift(search)
            search = @all_seen_words[search]
        end
        # Returns build path if there is a valid path from source to target 
        # (i.e. path includes more than just target)
        path.length > 1 ? path : "NO POSSIBLE PATH"
    end

    # Main runner to create word chain
    def run(source, target)
        # Re-Initialize data so that class can be reused for multiple runs
        @current_words = []
        @all_seen_words = Hash.new
        # Checks novel corner case where source = target and source is in dictionary
        if source == target && @dictionary.include?(source)
            print "#{[source]}\n"
            return false
        end
        # Initializes current word as source
        @current_words = [source]
        # Sets previously seen word as nil since source is beginning
        @all_seen_words[source] = nil
        # Checks to see if there are no more current words to explore
        # Or if target word is found
        while !@current_words.empty? && @all_seen_words[target].nil?
           explore_current_words
        end
        print "#{build_path(target)}\n"
    end
end

class String
    
    # Helper method that compares characters at each index 
    # And returns if only 1 character is different (adjacent)
    def adjacent(word)
        return false if self.length != word.length
        self.split('').select.with_index{|char,idx| char != word[idx]}.length == 1
    end
end

if __FILE__ == $PROGRAM_NAME
    wc = WordChainer.new("dictionary.txt")
    source = "ballet"
    target = "filler"
    puts "TEST WORD_CHAINER"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = "fish"
    target = "ball"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = "cab"
    target = "car"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = "ballet"
    target = "ballad"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = ""
    target = ""
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = "ball"
    target = "ball"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = ""
    target = "ball"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
    source = "cab"
    target = "ball"
    puts "Build Path from '#{source}' to '#{target}'\n"
    wc.run(source,target)
end