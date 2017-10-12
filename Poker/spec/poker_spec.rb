require 'rspec'
require 'poker'

RSpec.describe "#card" do
  subject(:card){Card.new(11, :s)}
  it "initializes with a card value and suite" do
    expect(card.suite).to eq(:s)
    expect(card.value).to eq (11)
  end
end

  describe "Deck" do
    subject(:deck){Deck.instance}
    it "has 52 cards" do
      expect(deck.cards).to eq(52)
    end

    it "can shuffle" do
      dummy=deck.cards.dup
      expect(deck.shuffle).to_not eq(dummy)
    end
    it "gives cards" do
      temp=deck.card.length
      expect(deck.give_card).to be_a(Card)
      expect(deck.cards.length).to be < temp
    end
  end
  describe "player" do
    subject(:player){Player.new}
    it "has a hand" do
      expect(player.hand).to be_a(Hand)
    end
    it "has a pot" do
      expect (player.pot).to be_an(Integer)
    end
    it "keeps track of whether its in the hand or not" do
      player.folded=false
      player.fold
      expect(player.folded).to be_true
    end
  end


  describe "#game" do

    let(:truong) {double("truong", :pot => 10000)}
    let(:tim) {double("Tim", :get_input, ["bet",100])}
    let(:david) {double("David" ,:folded => true, :raise => ["raise", 200])}
    let(:mike) {double("Mike")}
    let(:players) {[truong,tim,david,mike ]}
    subject(:game){Game.new(players)}


      it "initializes an array of players" do
        expect(game.players).to be_an(Array)
      end

      it "initializes with a deck" do
        expect(game.deck).to be_a(Deck)
      end

      it "initializes with an empty pot" do
        expect (game.pot).to eq(0)
      end

      it "keeps track of whos turn it is" do
        old=game.current_player
        game.next_turn
        expect (game.current_player).to_not eq(old)
      end

      it "moves marker to the next player after every turn" do
          old=game.current_player
          game.next_turn
          expect(game.current_player).to_not eq(old)
      end

      it "changes stages after player marker makes full rotation" do
        game.button=3
        game.current_player=2
        game.stage=1
        game.next_turn
        expect(game.stage).to eq(2)
      end

      it "dealer button and stage changes after stage 2 play" do
        game.button=2
        game.current_player=1
        game.stage=2
        game.next_turn
        expect(game.button).to eq(3)
        expect(game.stage).to eq(1)
      end
      it "keeps track of current pot" do
        game.pot=0
        game.current_player=1
        game.next_turn
        expect(pot).to eq(100)
      end
      it "keeps track of current bet" do
        game.bet=100
        game.current_player=2
        game.next_turn
        expect(bet).to eq(200)
      end
      context "Game recieves and executes messages from player" do
        it "skips a folded player" do
          game.button=2
          game.current_player=1
          game.stage=1
          game.next_turn
          expect(current_player).to eq (3)

          it "takes raise message from player and increases current bet" do

          end
        end
      end

    end
