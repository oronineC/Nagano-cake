class AddLastNameKanjiToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :lastNameKanji, :string
    add_column :customers, :first_name_kanji, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postcode, :string
    add_column :customers, :street_address, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :is_customer_active , :boolean
  end

end
