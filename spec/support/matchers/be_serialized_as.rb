RSpec::Matchers.define :be_serialized_as do |expected|
  match do |actual|
    coerce(serialize(actual)) == coerce(expected)
  end

  failure_message do |actual|
    <<-MSG.strip_heredoc
      expected
      #{coerce(expected)}
      got
      #{coerce(serialize(actual))}"
    MSG
  end

  def serialize(value)
    serializer_class = "#{value.class.name}Serializer".constantize
    serializer_class.new(value)
  end

  def coerce(value)
    case value = value.as_json
    when Hash
      value.with_indifferent_access
    else
      value
    end
  end
end
