class Admin < User
    after_create :set_approved_to_true

    def set_approved_to_true
        self.update(approved: true)
    end
end