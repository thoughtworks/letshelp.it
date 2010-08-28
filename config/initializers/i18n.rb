# coding: utf-8

module I18n

  def self.find_locale_name(locale)
    I18n.backend.translate(locale, "i18n.language.name")
  rescue I18n::MissingTranslationData
    locale.to_s
  end

end

I18n.default_locale = :'pt-BR'
