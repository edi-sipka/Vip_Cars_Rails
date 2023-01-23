require 'rails_helper'

RSpec.describe Car, type: :model do
  before :each do
    @car = Car.create(name: 'Audi A5',
        image: 'https://mediaservice.audi.com/media/fast/H4sIAAAAAAAAAFvzloG1tIiBOTrayfuvpGh6-m1zJgaGigIGBgZGoDhTtNOaz-I_2DhCHkCFGT8zsJSnJhUwAlW4MXFl5iamp-qDBPgZuRNNdVMrSnTzUnPz2YHS_DxJW5ofyXVrWZ4Q3CX60ezF66fHj31l4LmYuy3h0eI773gWWluYHow51SVVk8fA0_v4547nrqE9T-5c_CWQOjXb2fviSwYelZeHdRs2SJi6H2havOb-PuucxcoTGHh2d7NUJEbF3NT7FeB-5N7mXzsTDAsYeLRVg5i2JS1OKf4eZd2XI9zzsbK8nIFnz-eSC6JnqtrtrlWv2beuN_HXiYi5DDxVRZ275q87eaJn2ydnhg2RV1fryx5i4DkleGrNhqUqrVcDvvwKEjSJCqza3sjA833ml2j3G9UHd9cZaC1bqH0-3VVnDwNP2onGe-p_kzJmv922ec-mS6VXIuqTGXju7O253NFcVbmXT2rrKXGePaU9k7wZeC7pSWY3Vp9_PnPD-l9Fi9ynTmOoyWLgmbbn69R85rMB5XPduKex5i96NcU8l4EnOFpw9iLbjdN53Beay9RpTZ5rwWrOwAoMbqYyIMGiDiR4DgEJjgIGMAmKiGlAgjELxGfdzMzAwO3AwMAWwgACfMKlRTkFiUWJuXpFqcUF-XnFmWWpghoGRAJhVh_HSNcgABlDf3cmAgAA?mimetype=image/png',
        model: '2022',
        price: 130,
        description: 'Best car in a class.') 
  end
end