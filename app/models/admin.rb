class Admin < User
  after_create :set_approved_to_true

  def set_approved_to_true
    update(approved: true)
  end
end
