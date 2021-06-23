class Admin < User
  scope :unapproved_users, -> { where(approved: false) }
end
