class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                   presence: true
  validates :encrypted_password,         presence: true,　length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :family_name_kanji,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
  validates :family_name_furigana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
  validates :first_name_kanji,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
  validates :first_name_furigana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現

end
