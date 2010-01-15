# This plugin adds a way to throttle ActiveRecord creation.
# Add +gimme_a_break+ to your model to enable the throttling.
# It will then not be possible to create models in quick succession.
# The error message will be added to the base object, and can be
# localized using the key +gimme_a_break.notice+.
module GimmeABreak
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def gimme_a_break(options ={})
      cattr_accessor :gimme_a_break_timeout
      self.gimme_a_break_timeout = (options[:timeout] || 6)
      send :include, InstanceMethods
      
      class_eval <<-EOV
        validate :gimme_a_break
      EOV
    end
  end

  module InstanceMethods
    protected
      def gimme_a_break
        if last_created && last_created.created_at > self.class.gimme_a_break_timeout.seconds.ago
          errors.add_to_base I18n.t("gimme_a_break.notice", :default => "Temporarily disabled due to a safety measure. Please try again in #{self.class.gimme_a_break_timeout} seconds", :count => self.class.gimme_a_break_timeout)
        end
      end
      
      def last_created
        self.class.find(:first, :order => 'created_at desc')
      end
  end
end  
