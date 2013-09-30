module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end

  module  InstanceMethods
    def my_instance_method
      puts "my instance method"
    end
    
    def plus_vote_count
      self.votes.where(vote: true).count
    end

    def minus_vote_count
      self.votes.where(vote: false).count
    end
  end

  module ClassMethods
    def my_class_method
      has_many :votes, as: :voteable
      puts "my class methods."
    end
  end
end