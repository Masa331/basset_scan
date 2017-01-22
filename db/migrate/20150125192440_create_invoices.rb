class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :variable_symbol
      t.string :specific_symbol
      t.string :constant_symbol

      t.string :supplier_name
      t.string :supplier_name

      t.float :total_price

      t.string :invoice_text

      t.timestamp :tax_point_date
      t.timestamp :payemnt_due_date

      t.timestamps null: false
    end
  end
end
