class Brand < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :modifications

  def years_production
    year_start = nil
    year_stop = nil
    modifications.each do |mod|
      p mod.start_production
      if not year_start or mod.start_production < year_start
        year_start = mod.start_production
      end

      if not year_stop or (year_stop and mod.stop_production > year_stop)
        year_stop = mod.stop_production
      end
    end

    if not year_stop
      year_stop = "наст."
    end

    "#{year_start}-#{year_stop}"
  end
end
