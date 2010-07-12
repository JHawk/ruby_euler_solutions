# How many hands did player one win in the game of poker?
class Problem54 < Problem 
  class Hand
    attr_reader :cards, :ranks, :counts
    @@rank_score = 
      { "2" => 1, "5" => 4, "8" => 7, "J" => 10, "A" => 13,
        "3" => 2, "6" => 5, "9" => 8, "Q" => 11,
        "4" => 3, "7" => 6, "T" => 9, "K" => 12 }
      
    def initialize(arr)
      @cards = arr.sort {|a,b| @@rank_score[a[0]] <=> @@rank_score[b[0]]}
      @ranks = @cards.map {|c|c[0]}
      @counts = {}
      @ranks.each {|r| @counts[r] ||= @ranks.count(r)}
      @biggest_count = @counts.values.max
    end
    
    def straight? 
      @straight ||= 
        (@@rank_score[ranks.first]..@@rank_score[ranks.last]).to_a == ranks.map {|r| @@rank_score[r]} 
    end
    
    def flush? ; @flush ||= @cards.all? {|c|c[1] == @cards[0][1]} end
    
    def full_house? ; counts.values.sort == [2,3] end
    
    def straight_flush? ; flush? && straight? end
    
    def royal_flush? ; flush? && ranks == ["T","J","Q","K","A"] end
    
    def two_pair? ; counts.values.count(@biggest_count) == 2 end
    
    def score
      @score ||= case 
        when royal_flush?         then 9
        when straight_flush?      then 8
        when @biggest_count == 4  then 7
        when full_house?          then 6
        when flush?               then 5
        when straight?            then 4
        when @biggest_count == 3  then 3
        when two_pair?            then 2 
        when @biggest_count == 2  then 1
        else 0
      end
    end
    
    def sorted_counts ; @sorted_counts ||= counts.sort {|i,j| i[1] <=> j[1]} end
    
    def greater_than_by_rank(o)
      h1 = sorted_counts.reverse
      o.sorted_counts.reverse.each_with_index do |rank_count,idx|
        r1 = @@rank_score[h1[idx][0]] ; r2 = @@rank_score[rank_count[0]]
        next if r1 == r2
        return r1 > r2
      end
    end
    
    def >(o) 
      s1 = score ; s2 = o.score
      if s1 == s2 then greater_than_by_rank(o) else s1 > s2 end
    end
    
    def <(o) not self > o end
  end

  def initialize
    @data = File.read("#{File.dirname(__FILE__)}/../data/poker54.txt").split("\n").map {|r| r.split /\s/ }
    super
  end
  
  def problem(data=@data)
    data.inject(0) {|wins,h| wins + (Hand.new(h[0..4]) > Hand.new(h[5..9]) ? 1 : 0)}
  end  
end
