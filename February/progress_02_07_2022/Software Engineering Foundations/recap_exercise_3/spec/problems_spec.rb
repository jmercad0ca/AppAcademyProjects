require "problems"
require "byebug"

describe "no_dupes?" do
    it "should return an array containing the elements that were not repeated in the array" do
        expect(no_dupes?([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
        expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
        expect(no_dupes?([true, true, true])).to eq([])
    end
end

describe "no_consecutive_repeats?" do
    it "should return true if array contains no consecutive repeats" do
        expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
        expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)              
        expect(no_consecutive_repeats?(['x'])).to eq(true)                              
    end

    it "should return false if array contains consecutive repeats" do
        expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false) 
        expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false) 
    end
end

describe "char_indices" do
    it "should return a hash containing characters and their respective indices in a word" do
        expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
        expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
    end
end

describe "longest_streak" do
    it "should return the longest streak of consecutive characters in the string" do
        expect(longest_streak('a')).to eq('a')
        expect(longest_streak('accccbbb')).to eq('cccc')
        expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
        expect(longest_streak('aaabbb')).to eq('bbb')
        expect(longest_streak('abc')).to eq('c')   
    end
end

describe "bi_prime?" do
    it "should return true when a pair of prime factors exist" do
        expect(bi_prime?(14)).to eq(true)
        expect(bi_prime?(22)).to eq(true)
        expect(bi_prime?(25)).to eq(true)
        expect(bi_prime?(94)).to eq(true)
    end

    it "should return false when no pairs of prime factors exist" do
        expect(bi_prime?(24)).to eq(false)
        expect(bi_prime?(64)).to eq(false)
    end
end

describe "vigenere_cipher" do
    it "should return an encrypted message using vigenere coding" do 
        expect(vigenere_cipher("toerrishuman", [1])).to eq('upfssjtivnbo') 
        expect(vigenere_cipher("toerrishuman", [1, 2])).to eq('uqftsktjvobp')
        expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq('uqhstltjxncq')
        expect(vigenere_cipher("zebra", [3, 0])).to eq('ceerd')
        expect(vigenere_cipher("yawn", [5, 1])).to eq('dbbo')
    end
end

describe "vowel_rotate" do 
    it "should return a string with vowels rotated" do
        expect(vowel_rotate('computer')).to eq("cempotur")
        expect(vowel_rotate('oranges')).to eq("erongas")
        expect(vowel_rotate('headphones')).to eq("heedphanos")
        expect(vowel_rotate('bootcamp')).to eq("baotcomp")
        expect(vowel_rotate('awesome')).to eq("ewasemo")
    end
end

describe "String" do
    describe "#select" do
        it "should return the string where characters are filtered by proc" do
            expect("app academy".select { |ch| !"aeiou".include?(ch) }).to eq("pp cdmy")
            expect("HELLOworld".select { |ch| ch == ch.upcase }).to eq("HELLO")
        end
        it "should return empty string when proc is not provided" do
            expect("HELLOworld".select).to eq("")
        end
    end
    
    describe "#map!" do
        it "should return the string where characters are modified by proc" do
            word_1 = "Lovelace"
            word_1.map! do |ch| 
                if ch == 'e'
                    '3'
                elsif ch == 'a'
                    '4'
                else
                    ch
                end
            end
            expect(word_1).to eq("Lov3l4c3")

            word_2 = "Dijkstra"
            word_2.map! do |ch, i|
                if i.even?
                    ch.upcase
                else
                    ch.downcase
                end
            end
            expect(word_2).to eq("DiJkStRa")
        end
    end
end

describe "multiply" do 
    it "should return the product of two numbers" do
        expect(multiply(3, 5)).to eq(15)
        expect(multiply(5, 3)).to eq(15)    
        expect(multiply(2, 4)).to eq(8)
        expect(multiply(0, 4)).to eq(0)
        expect(multiply(-3, -6)).to eq(18)
        expect(multiply(3, -6)).to eq(-18)
        expect(multiply(-3, 6)).to eq(-18)
    end
end

describe "lucas_sequence" do
    it "should return the lucas sequence of length determined by parameter" do
        expect(lucas_sequence(0)).to eq([])
        expect(lucas_sequence(1)).to eq([2])    
        expect(lucas_sequence(2)).to eq([2,1])
        expect(lucas_sequence(3)).to eq([2, 1, 3])
        expect(lucas_sequence(6)).to eq([2, 1, 3, 4, 7, 11])
        expect(lucas_sequence(8)).to eq([2, 1, 3, 4, 7, 11, 18, 29])
    end
end

describe "prime_factorization" do 
    it "should return an array of prime factors of a given number" do
        expect(prime_factorization(12)).to eq([2, 2, 3])
        expect(prime_factorization(24)).to eq([2, 2, 2, 3])
        expect(prime_factorization(25)).to eq([5, 5])
        expect(prime_factorization(60)).to eq([2, 2, 3, 5])
        expect(prime_factorization(7)).to eq([7])
        expect(prime_factorization(11)).to eq([11])
        expect(prime_factorization(2017)).to eq([2017])
    end
end

# describe "most_frequent_bigram" do
#     it "should return the bigram that appears the most in the string" do
#         expect(most_frequent_bigram("thethrillofit")).to eq("th")
#         expect(most_frequent_bigram("gotothemoonsoonforproof")).to eq("oo")
#         expect(most_frequent_bigram("bananasareanotherfruit")).to eq("an")
#     end
# end

# describe "Array" do
#     describe "#pair_sum_count" do
#         it "should return the number of pairs of elements that add to the given num" do
#             expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
#             expect([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
#             expect([10, 3, 6, 5, 7].pair_sum_count(4)).to eq(0)
#         end
#     end

#     describe "#bubble_sort" do
#         context "when no proc is given as an arg" do
#             it "should sort the array in increasing order by default" do
#                 expect([4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort).to eq([1, 2, 4, 8, 9, 12, 14, 24, 25, 81])
#             end 
#         end

#         context "when a proc is given as an arg" do
#             it "should sort the array according to proc" do
#                 actual = [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s } # this block will sort the numbers "alphabetically" by characters
#                 expect(actual).to eq([1, 12, 14, 2, 24, 25, 4, 8, 81, 9])
#             end
#         end

#         it "should mutate the existing array" do
#             array = [5, 4, 7]
#             expect(array.bubble_sort).to be(array)
#             expect(array).to eq([4, 5, 7])
#         end
#     end
# end

