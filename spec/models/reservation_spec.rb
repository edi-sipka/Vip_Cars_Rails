RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.create(name: 'Edi', email: 'edi@gmail.com', password: '123123')
    @car = Car.create(name: 'Audi A5',
                      image: 'https://mediaservice.audi.com/media/fast/H4sIAAAAAAAAAFvzloG1tIiBOTrayfuvpGh6-m1zJgaGigIGBgZGoDhTtNOaz-I_2DhCHkCFGT8zsJSnJhUwAlW4MXFl5iamp-qDBPgZuRNNdVMrSnTzUnPz2YHS_DxJW5ofyXVrWZ4Q3CX60ezF66fHj31l4LmYuy3h0eI773gWWluYHow51SVVk8fA0_v4547nrqE9T-5c_CWQOjXb2fviSwYelZeHdRs2SJi6H2havOb-PuucxcoTGHh2d7NUJEbF3NT7FeB-5N7mXzsTDAsYeLRVg5i2JS1OKf4eZd2XI9zzsbK8nIFnz-eSC6JnqtrtrlWv2beuN_HXiYi5DDxVRZ275q87eaJn2ydnhg2RV1fryx5i4DkleGrNhqUqrVcDvvwKEjSJCqza3sjA833ml2j3G9UHd9cZaC1bqH0-3VVnDwNP2onGe-p_kzJmv922ec-mS6VXIuqTGXju7O253NFcVbmXT2rrKXGePaU9k7wZeC7pSWY3Vp9_PnPD-l9Fi9ynTmOoyWLgmbbn69R85rMB5XPduKex5i96NcU8l4EnOFpw9iLbjdN53Beay9RpTZ5rwWrOwAoMbqYyIMGiDiR4DgEJjgIGMAmKiGlAgjELxGfdzMzAwO3AwMAWwgACfMKlRTkFiUWJuXpFqcUF-XnFmWWpghoGRAJhVh_HSNcgABlDf3cmAgAA?mimetype=image/png',
                      model: '2022',
                      price: 130,
                      description: 'Best car in a class.')
    @reservation = Reservation.new(user: @user, car: @car, reservation_date: Date.today, returning_date: Date.today + 2.day, city: 'Casablanca')
  end

  context 'Testing' do
    it 'Valid user reservation' do
      @reservation.save
      expect(@reservation).to be_valid
    end
    it 'Invalid without user_id' do
      @reservation.user_id = nil
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'Invalid without car_id' do
      @reservation.car_id = nil
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'Valid with city' do
      @reservation.city = 'Temisvar'
      @reservation.save
      expect(@reservation).to be_valid
    end
    it 'Reservation date is today' do
      @reservation.reservation_date = Date.today
      @reservation.save
      expect(@reservation).to be_valid
    end

    it 'Returning date can not be today' do
      @reservation.returning_date = Date.today + 2.day
      @reservation.save
      expect(@reservation).to be_valid
    end
  end
  context 'Testing Reservation Associations' do
    it 'has_many reservations' do
      assoc = Car.reflect_on_association(:reservations)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many cars ' do
      assoc = Car.reflect_on_association(:users)
      expect(assoc.macro).to eq :has_many
    end
  end
end
