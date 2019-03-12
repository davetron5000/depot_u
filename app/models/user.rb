class User < ApplicationRecord
#START_HIGHLIGHT
  validates :name, presence: true, uniqueness: true
#END_HIGHLIGHT
  has_secure_password

  #START:after_destroy
  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end     
  #END:after_destroy
end
