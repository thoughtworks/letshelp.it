class LocaleVerifier

  def initialize(available_locales)
    @available_locales = available_locales.map { |x| x.to_s } if available_locales
  end
  
  def find_compatible_locale(locales)
    Array(locales).map do |y|
      compatible_locale = @available_locales.find { |x| x == y }
      compatible_locale ||= @available_locales.find { |x| x[0...2] == y[0...2] }
    end.compact.first if locales
  end

  # Parses the HTTP Accept-Language header as specified in RFC 2616, returning
  # an array of strings representing the prioritized locales with capitalization
  # normalized.
  #
  # Example:
  #
  #   request.parse_accept_language_string 'da, en-gb;q=0.8, en;q=0.7, FR-FR;q=0.9'
  #   # => [ 'da', 'fr-FR', 'en-GB', 'en' ]
  #
  def parse_accept_language_string(string)
    if string
      string.split(/\s*,\s*/).collect do |l|
        l += ';q=1.0' unless l =~ /;q=\d+\.\d+$/
        l.split(';q=')
      end.sort do |x,y|
        raise "Not correctly formatted" unless x.first =~ /^[a-z\-]+$/i
        y.last.to_f <=> x.last.to_f
      end.collect do |l|
        l.first.downcase.gsub(/-[a-z]+$/i) { |x| x.upcase }
      end
    end
  end

end
