class AddPaperclipToInvoices < ActiveRecord::Migration
  def self.up
    add_attachment :invoices, :scan
  end

  def self.down
    remove_attachment :invoices, :scan
  end
end
