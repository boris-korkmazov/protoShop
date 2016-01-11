class Modification < ActiveRecord::Base
  belongs_to :brand

  def readable_stop_production
    unless stop_production
      return "наст."
    end
    stop_production
  end
end
