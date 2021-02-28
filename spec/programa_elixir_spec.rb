require './src/programa_elixir'

RSpec.describe 'ProgramaElixir' do
  describe '.sum_items_price' do
    context 'when items list is empty' do
      let(:shopping_list) { [] }

      it 'expects to return 0' do
        expect(sum_items_price(shopping_list)).to eq 0
      end
    end

    context 'when items list have only 1 item' do
      let(:shopping_list) do
        [
          ['lemon', 1, 333]
        ]
      end

      it 'expects to return the value of this item' do
        expect(sum_items_price(shopping_list)).to eq 333
      end
    end

    context 'when items list have 5 items' do
      let(:shopping_list) do
        [
          ['lemon', 1, 3_33],
          ['neston', 1, 250_00],
          ['acai', 1, 30_00],
          ['trakinas', 3, 1_25],
          ['doritos', 1, 9_80]
        ]
      end

      it 'expects to return the sum value of the items' do
        expect(sum_items_price(shopping_list)).to eq 296_88
      end
    end
  end

  describe '.how_much_should_customers_pay' do
    context 'when the division by customer generates a infinity division' do
      let(:value) { 100 }
      let(:customers) do
        [
          'customer1@example.com',
          'customer2@example.com',
          'customer3@example.com'
        ]
      end

      let(:function) { how_much_should_customers_pay(value, customers) }

      it 'expects to return value 33 to customer 1' do
        expect(
          function[0]
        ).to eq 33
      end

      it 'expects to return value 33 to customer 2' do
        expect(
          function[1]
        ).to eq 33
      end

      it 'expects to return value 34 to customer 3' do
        expect(
          function[2]
        ).to eq 34
      end
    end

    context 'when the value is 0' do
      let(:value) { 0 }
      let(:customers) do
        [
          'customer1@example.com',
          'customer2@example.com'
        ]
      end

      let(:function) { how_much_should_customers_pay(value, customers) }

      it 'expects to return 0 to customer 1' do
        expect(
          function[0]
        ).to eq 0
      end

      it 'expects to return 0 to customer 2' do
        expect(
          function[1]
        ).to eq 0
      end
    end

    context 'when the division by customers generate a equals division' do
      let(:value) { 75_00 }
      let(:customers) do
        [
          'customer1@example.com',
          'customer2@example.com',
          'customer3@example.com'
        ]
      end

      let(:function) { how_much_should_customers_pay(value, customers) }

      it 'expects to return 25_00 to customer 1' do
        expect(
          function[0]
        ).to eq 25_00
      end

      it 'expects to return 25_00 to customer 2' do
        expect(
          function[1]
        ).to eq 25_00
      end

      it 'expects to return 25_00 to customer 3' do
        expect(
          function[2]
        ).to eq 25_00
      end
    end

    context 'when customer list is empty' do
      let(:value)           { 75_00 }
      let(:customers)       { [] }
      let(:function) { how_much_should_customers_pay(value, customers) }

      it 'expects to return an empty list' do
        expect(function).to eq []
      end
    end
  end

  describe '.pay_list_with_values' do
    let(:values) { [2, 2, 3] }
    let(:customers) do
      [
        'customer1@example.com',
        'customer2@example.com',
        'customer3@example.com'
      ]
    end

    let(:function) { pay_list_with_values(values, customers) }

    it 'expects to return the customer 1 and their respective value transposed' do
      expect(
        function[0]
      ).to eq ['customer1@example.com', 2]
    end

    it 'expects to return the customer 2 and their respective value transposed' do
      expect(
        function[1]
      ).to eq ['customer2@example.com', 2]
    end

    it 'expects to return the customer 3 and their respective value transposed' do
      expect(
        function[2]
      ).to eq ['customer3@example.com', 3]
    end
  end

  describe '.main' do
    let(:shopping_list) do
      [
        ['lemon', 1, 3_33],
        ['neston', 1, 250_00],
        ['acai', 1, 30_00]
      ]
    end

    let(:customers) do
      [
        'customer1@example.com',
        'customer2@example.com',
        'customer3@example.com'
      ]
    end

    let(:function) { main(shopping_list, customers) }

    it 'expects to return' do
      expect(
        function[0]
      ).to eq ['customer1@example.com', 9444]
    end

    it 'expects to return' do
      expect(
        function[1]
      ).to eq ['customer2@example.com', 9444]
    end

    it 'expects to return' do
      expect(
        function[2]
      ).to eq ['customer3@example.com', 9445]
    end
  end
end
