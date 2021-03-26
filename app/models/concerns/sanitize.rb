module Sanitize
  extend ActiveSupport::Concern

  class_methods do
    def strip_attributes(*attributes)
      attributes.each do |attr|
        before_validation do |record|
          record[attr] = record[attr].strip
        end
      end
    end
  end
end
