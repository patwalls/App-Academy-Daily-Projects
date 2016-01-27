require 'arrays'

describe "Array" do
  describe "my_uniq" do
    let(:test_ary) {[1, 2, 1, 3, 3]}
    it "return uniq results" do
      expect(test_ary.my_uniq).to eq([1,2,3])
    end
  end

  describe "two_sum" do

    it "returns multiple arrays representing positions of elements adding to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "my_transpose" do
    let(:my_matrix) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
    let(:transpose_results) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]}
    it "transpose postions" do
      expect(my_matrix.my_transpose).to eq(transpose_results)
    end
  end

  describe "stock_picker" do
    let(:stock_prices) {[233,245,200,250,500]}
    let(:results) {[2,4]}
    it "returns lowest day to buy and highest day to sell" do
      expect(stock_prices.stock_picker).to eq(results)
    end
  end
end
