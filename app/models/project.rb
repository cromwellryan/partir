class Project < ActiveRecord::Base
  tokenize :token, length: 32
end

