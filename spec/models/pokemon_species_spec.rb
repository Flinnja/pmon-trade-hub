require 'rails_helper'

RSpec.describe PokemonSpecies, type: :model do
  context 'validations' do
  	it {should validate_presence_of(:name)}
  	it {should validate_uniqueness_of(:name).case_insensitive}
  	it {should validate_presence_of(:national_dex_no)}
  	it {should validate_uniqueness_of(:national_dex_no)}
  end
end
