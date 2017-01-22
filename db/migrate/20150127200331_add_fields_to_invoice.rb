class AddFieldsToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :note, :string
    add_column :invoices, :centre, :string
    add_column :invoices, :transporter, :string
    add_column :invoices, :payment_means, :string
    add_column :invoices, :bank_code, :string
    add_column :invoices, :account_number, :string
    add_column :invoices, :currency_id, :string
    add_column :invoices, :discount, :string
    add_column :invoices, :iban, :string

    add_column :invoices, :item_product, :string
    add_column :invoices, :item_quantity, :string
    add_column :invoices, :item_discount, :string
    add_column :invoices, :expiration, :string
    add_column :invoices, :serial_number, :string
    add_column :invoices, :unit_price, :string
    add_column :invoices, :item_centre, :string
    add_column :invoices, :item_series, :string
    add_column :invoices, :item_vat_rate, :string
    add_column :invoices, :unit_centre, :string
  end
end
