class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                   presence: true
  validates :encrypted_password,         presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name_kanji
    validates :family_name_kanji

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_furigana
    validates :family_name_furigana
  end
end
