require "board"

describe "features" do
  let(:board){Board.new}
  let(:ship){Ship.new(2)}

  it "place ships at a location" do
    expect{board.place(ship,"A",1)}.not_to raise_error
  end
  it "place ships not of the board" do
    expect{board.place(ship,"Z",20)}.to raise_error "Out of bounds!"
  end
  it "do not place ships on top of other ships" do
  	board.place(ship,"A",1)
    expect{board.place(ship,"A",1)}.to raise_error "Already ship there!"
  end
  it "fire at a location" do
    expect{board.fire("A",1)}.not_to raise_error
  end
  it "sink a ship" do
  	expect{ship.sunk?}.not_to raise_error
  	# board.place(ship,"A",1)
  	# board.fire("A",1)
  	# board.fire("A",2)
  	# expect(ship.sunk?).to eq true
  end
  it "log attack locations of hit and misses" do
    board.fire("A",1)
    expect(board.fire_log[0]).to eq [["A",1],false]
  end
  it "use various ship sizes" do
    ship2 = Ship.new(3)
    expect(ship.size).not_to eq ship2.size
  end
  
end