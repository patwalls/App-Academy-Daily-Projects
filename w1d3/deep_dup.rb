# a method to deep duplicate arrays only
class Array
  def deep_dup
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end
  end
end
