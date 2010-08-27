require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class LocaleVerifierTest < Test::Unit::TestCase

  should "return first compatible locale from array" do
    available_locales = [ :en, :pt, :de ]
    locale_verifier = LocaleVerifier.new(available_locales)
    assert_equal 'en', locale_verifier.find_compatible_locale(['it', 'en-US', 'de'])
  end

  should "return exactly match from array if more than one compatible locale is available" do
    available_locales = [:pt, :'pt-BR']
    locale_verifier = LocaleVerifier.new(available_locales)
    assert_equal 'pt-BR', locale_verifier.find_compatible_locale('pt-BR')
  end

  should "return return nil if no compatible locale is found" do
    available_locales = [ :en, :pt ]
    locale_verifier = LocaleVerifier.new(available_locales)
    assert_nil locale_verifier.find_compatible_locale(['it', 'de'])
  end    

  should "normalize and order request HTTP_ACCEPT_LANGUAGE parameter correctly" do
    locale_verifier = LocaleVerifier.new(nil)
    http_accept_language = locale_verifier.parse_accept_language_string('da, en-gb;q=0.8, en;q=0.7, FR-FR;q=0.9')
    assert_equal [ 'da', 'fr-FR', 'en-GB', 'en' ], http_accept_language
  end

  should "return nil if request HTTP_ACCEPT_LANGUAGE parameter is nil" do
    locale_verifier = LocaleVerifier.new(nil)
    assert_nil locale_verifier.parse_accept_language_string(nil)
  end

end
