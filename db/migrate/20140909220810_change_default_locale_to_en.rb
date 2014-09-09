class ChangeDefaultLocaleToEn < ActiveRecord::Migration
  def up
    change_column_default(:users, :default_locale, 'en')
  end

  def down
    change_column_default(:users, :default_locale, 'pt')
  end
end
