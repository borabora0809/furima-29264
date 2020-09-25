require 'rails_helper'

describe User do
  describe '#create' do

      # 入力されている場合のテスト ▼

      it "全ての項目の入力が存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      # nul:false, presence: true のテスト ▼

      it "ニックネームが必須であること" do # テストしたいことの内容
        user = build(:user, nickname: nil) # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入(今回の場合は意図的にnicknameの値をからに設定)
        user.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
        expect(user.errors[:nickname]).to include("を入力してください") # errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "メールアドレスが必須であること" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "メールアドレスが一意性であること" do
        user = create(:user) # createメソッドを使用して変数userとデータベースにfactory_botのダミーデータを保存
        another_user = build(:user, email: user.email) # 2人目のanother_userを変数として作成し、buildメソッドを使用して、意図的にemailの内容を重複させる
        another_user.valid? # another_userの「バリデーションにより保存ができない状態であるか」をテスト
        expect(another_user.errors[:email]).to include("はすでに存在します") # errorsメソッドを使用して、emailの「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、その原因のエラー文を記述
      end

      it "パスワードが必須であること" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        user = build(:user, encrypted_password: nil)
        user.valid?
        expect(user.errors[:encrypted_password]).to include("を入力してください")
      end

      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "123456", encrypted_password: "123456") # buildメソッドを使用して7文字のパスワードを設定
        expect(user).to be_valid
      end

      it "passwordが6文字以下であれば登録できないこと" do
        user = build(:user, password: "12345", encrypted_password: "12345") # 意図的に6文字のパスワードを設定してエラーが出るかをテスト 
        user.valid?
        expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
      end

      it "パスワードは半角英数字混合であること" do
      
      end

      it "パスワードは確認用を含めて2回入力すること" do
        user = build(:user, encrypted_password: "") # 意図的に確認用パスワードに値を空にする
        user.valid?
        expect(user.errors[:encrypted_password]).to include("を入力してください", "は7文字以上で入力してください")
      end

      it "family_name_kanjiがない場合は登録できないこと" do
        user = build(:user, family_name_kanji: nil)
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("を入力してください")
      end

      it 'family_name_kanjiが全角入力でなければ登録できないこと' do
        user = build(:user, family_name_kanji: "ｱｲｳｴｵ") # 意図的に半角入力を行いエラーを発生させる
        user.valid?
        expect(user.errors[:family_name_kanji]).to include("は不正な値です")
      end

      it "first_name_kanjiがない場合は登録できないこと" do
        user = build(:user, first_name_kanji: nil)
        user.valid?
        expect(user.errors[:first_name_kanji]).to include("を入力してください")
      end

      it 'first_name_kanjiが全角入力でなければ登録できないこと' do
        user = build(:user, first_name_kanji: "ｱｲｳｴｵ") # 意図的に半角入力を行いエラーを発生させる
        user.valid?
        expect(user.errors[:first_name_kanji]).to include("は不正な値です")
      end

      it "family_name_furiganaがない場合は登録できないこと" do
        user = build(:user, family_name_furigana: nil)
        user.valid?
        expect(user.errors[:family_name_furigana]).to include("を入力してください")
      end

      it 'family_name_furiganaが全角カタカナでなければ登録できないこと' do
        user = build(:user, family_name_furigana: "あいうえお") # 意図的にひらがな入力を行いエラーを発生させる
        user.valid?
        expect(user.errors[:family_name_furigana]).to include("は不正な値です")
      end

      it "first_name_furiganaがない場合は登録できないこと" do
        user = build(:user, first_name_furigana: nil)
        user.valid?
        expect(user.errors[:first_name_furigana]).to include("を入力してください")
      end

      it 'first_name_fugriganaが全角カタカナでなければ登録できないこと' do
        user = build(:user, first_name_furigana: "あいうえお") # 意図的にひらがな入力を行いエラーを発生させる
        user.valid?
        expect(user.errors[:first_name_furigana]).to include("は不正な値です")
      end

      it "生年月日が必須であること" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end
  end
end