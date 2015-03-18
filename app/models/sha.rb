class SHA
  # Used for `serialize` method in ActiveRecord
  class << self
    def load(sha)
      self.new(sha)
    end
    def dump(obj)
      unless obj.is_a?(self)
        raise ::ActiveRecord::SerializationTypeMismatch,
          "Attribute was supposed to be a #{self}, but was a #{obj.class}. -- #{obj.inspect}"
      end
      obj.length
    end
  end

  attr_accessor :sha

  def initialize(sha)
    @sha = sha
  end

  def short
    to_s(format: :short)
  end
  alias_method :abbr, :short

  def to_s(options={})
    if [:short, :abbr].include?(options[:format])
      sha[0..7]
    else
      sha.to_s
    end
  end
end
