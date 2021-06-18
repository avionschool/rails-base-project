class Buyer < User
  before_create :set_default_to_true

  def set_default_to_true
    self.approved = true
  end
end
