RSpec::Matchers.define :eq_as_json do |expected|
  match do |actual|
    # I know that the response object in the tests responds to the #body
    # method. The code 👇 allows me to write expect(response).to(eq_as_json)
    # instead of expect(response.body).to(eq_as_json).
    actual = actual.body if actual.respond_to?(:body)

    coerce(parse(actual)) == coerce(expected)
  end

  failure_message do |actual|
    <<-MSG.strip_heredoc
      expected
      #{coerce(expected)}
      got
      #{coerce(parse(actual))}"
    MSG
  end

  def parse(body)
    coerce(JSON.parse(body))
  end

  def coerce(value)
    case value = value.as_json
    when Hash
      value.with_indifferent_access
    when Array
      values.map { |value| coerce(value) }
    else
      value
    end
  end
end
