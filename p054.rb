class Hand
    """
    Hand power (rank)
    0 High Card: Highest value card.
    1 One Pair: Two cards of the same value.
    2 Two Pairs: Two different pairs.
    3 Three of a Kind: Three cards of the same value.
    4 Straight: All cards are consecutive values.
    5 Flush: All cards of the same suit.
    6 Full House: Three of a kind and a pair.
    7 Four of a Kind: Four cards of the same value.
    8 Straight Flush: All cards are consecutive values of same suit.
    9 Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
    """
    attr_reader :hand
    def initialize(cards)
        @cards = make_cards(cards)
        @hand = make_hand()
    end

    def make_cards(cards)
        # for example: [[13, "D"], [7, "S"], [6, "S"], [5, "H"], [5, "C"]]
        cards.map {|card|
            # conversion card number to int in 2 to 14
            # for example: '2' => 2, 'T' => 10, 'A' => 14
            num = case card[0]
                when 'T' then 10
                when 'J' then 11
                when 'Q' then 12
                when 'K' then 13
                when 'A' then 14
                else card[0].to_i
            end
            suit = card[1]
            [num,suit]
        }.sort.reverse
    end

    def make_hand()
        # for example:
        #  [2,14] means "Pair of Aces"
        #  [6, 4] means "Full House with Three Fours"
        # 今回ジョーカーは考えなくていいので、ロイストからフルハウスまで・ストレート・スリーカードは勝敗が決定的。
        # フラッシュは数字の優劣だけ
        # 
        nums = @cards.map{|v| v[0]}
        high = nums[0]
        low  = nums[4]
        grouped = nums.group_by(&:itself).transform_values(&:length) # [9,9,8,8,8] => [9=>2, 8=>3]

        # 9 Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
        if is_flush?() and nums == [14,13,12,11,10]
            return [9]
        # 8 Straight Flush: All cards are consecutive values of same suit.
        elsif is_flush?() and is_straight?()
            # [A 5 4 3 2] only
            if nums == [14,5,4,3,2]
                return [8,5]
            else
                return [8,high]
            end
        # 7 Four of a Kind: Four cards of the same value.
        elsif grouped.has_value?(4)
            return [7,grouped.key(4)]
        # 6 Full House: Three of a kind and a pair.
        elsif grouped.has_value?(3) and grouped.has_value?(2)
            return [6,grouped.key(3)]
        # 5 Flush: All cards of the same suit.
        elsif is_flush?()
            return [5] + nums
        # 4 Straight: All cards are consecutive values.
        elsif is_straight?()
            if nums == [14,5,4,3,2]
                return [4,5]
            else
                return [4,high]
            end
        # 3 Three of a Kind: Three cards of the same value.
        elsif grouped.has_value?(3)
            return [3,grouped.key(3)]
        # 2 Two Pairs: Two different pairs.
        elsif grouped.has_value?(2) and grouped.length == 3
            # 3patterns [3,3,2,2,1] [3,3,2,1,1] [3,2,2,1,1]
            return [2,nums[1],nums[3]] + [grouped.key(1)]
        # 1 One Pair: Two cards of the same value.
        elsif grouped.has_value?(2)
            n = grouped.key(2)
            return [1,n] + (nums - [n])
        # 0 High Card: Highest value card.
        else
            return [0] + nums
        end
    end

    def is_flush?()
        # convert to suit array and count suits.
        @cards.map{|v| v[1]}.uniq.length == 1
    end

    def is_straight?()
        nums = @cards.map{|v| v[0]}
        h = nums[0] # high
        if nums == [14,5,4,3,2]
            return true
        elsif nums == [h,h-1,h-2,h-3,h-4]
            return true
        end
        return false
    end

    def win(p2)
        return @hand <=> p2.hand
    end
end

# ["5H 5C 6S 7S KD 2C 3S 8S 8D TD",
# "5D 8C 9S JS AC 2C 5C 7D 8S QH",
# "2D 9C AS AH AC 3D 6D 7D TD QD",
# "4D 6S 9H QH QC 3D 6D 7H QD QS",
# "2H 2D 4C 4D 4S 3C 3D 3S 9S 9D"]

win = 0
lose = 0
draw = 0
File.foreach("poker.txt") {|line|
    cards = line.split(" ")
    p1 = Hand.new(cards[0..4])
    p2 = Hand.new(cards[5..9])
    if p1.win(p2) > 0
        win += 1
    elsif p1.win(p2) < 0
        lose += 1
    else
        draw += 1
    end
}

puts [win,lose,draw]


