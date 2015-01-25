class Invoice < ActiveRecord::Base
  has_attached_file :scan
  do_not_validate_attachment_file_type :scan

  def name
    "Faktura #{id}"
  end
end
