class Genre < ApplicationRecord
	has_many :products


	enum name: { design: 0, art: 1, music: 2, fashion: 3, programming: 4, language: 5, love: 6, 
		business: 7, WEBdesign: 8, consulting: 9, lisence: 10, others: 11 }
end
