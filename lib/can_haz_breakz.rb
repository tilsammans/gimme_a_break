# This plugin adds a way to throttle ActiveRecord creation.
# Add +can_haz_breakz+ to your model to enable the throttling.
# It will then not be possible to create models in quick succession.
# The error message will be added to the base object, and can be
# localized using the key +can_haz_breakz.break+.
module CanHazBreakz
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def can_haz_breakz(options ={})
      cattr_accessor :can_haz_breakz_timeout
      self.can_haz_breakz_timeout = (options[:timeout] || 6)
      send :include, InstanceMethods
      
      class_eval <<-EOV
        validate :can_haz_break
      EOV
    end
  end

  module InstanceMethods
    protected
      def can_haz_break
        if last_created && last_created.created_at > self.class.can_haz_breakz_timeout.seconds.ago
          errors.add_to_base I18n.t("can_haz_breakz.break", :default => "Temporarily disabled due to a safety measure. Please try again in #{self.class.can_haz_breakz_timeout} seconds", :count => self.class.can_haz_breakz_timeout)
        end
      end
      
      def last_created
        self.class.find(:first, :order => 'created_at desc')
      end
  end
end  
