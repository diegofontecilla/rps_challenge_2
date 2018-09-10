require 'game_logic'

describe GameLogic do

  let(:fake_computer) { double(:the_computer) }
  let(:fake_players) { double(:players, :player_1 => 'diego', :player_2 => 'the computer') }
  subject(:game_logic) { GameLogic.new(fake_players, fake_computer) }

  context '#get_winner' do

    it 'make player wins when choose rock and computer scissors' do
      allow(fake_computer).to receive(:computer_choice).and_return('scissors')
      fake_computer.computer_choice
      expect(game_logic.get_winner('rock')).to eq('diego is the winner!')
    end

    it 'make player loose when choose scissors and computer rock' do
      allow(fake_computer).to receive(:computer_choice).and_return('rock')
      fake_computer.computer_choice
      expect(game_logic.get_winner('scissors')).to eq('the computer is the winner!')
    end

    it 'declare a tie when computer and player choose the same' do
      allow(fake_computer).to receive(:computer_choice).and_return('paper')
      fake_computer.computer_choice
      expect(game_logic.get_winner('paper')).to eq('this is a TIE!')
    end
  end
end
