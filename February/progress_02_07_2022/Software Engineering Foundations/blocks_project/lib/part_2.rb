def all_words_capitalized?(words)
    words.all?{|word| word == word.capitalize}
end

def no_valid_url?(urls)
    domains = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        domains.any?{|domain| url.end_with?(domain) }
    end
end

def any_passing_students?(students)
    students.any? do |student| 
        student[:grades].sum / (student[:grades].length.to_f)>= 75 
    end
end

