FactoryBot.define do
  factory :type_efficacy do
    effectiveness { "MyString" }
  end

  factory :type do
    name { "Normal" }
  end


	factory :pokemon_species do
		name { "Bulbasaur" }
		national_dex_no { "1" }
		can_be_shiny { true }
	end

end
