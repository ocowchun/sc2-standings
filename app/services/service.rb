class Service
  class PerformFailed < StandardError; end

  def perform
    raise "Method `perform` should be implemented on class #{self.class}"
  end
end
