module HomeHelper
  
  def generate_locale_menu_html
      '<form method="get">' +
        select_tag("locale", options_for_select(I18n.available_locales.collect{ |x| [I18n.find_locale_name(x), x]}, I18n.locale), { :onchange => "this.form.submit()"}) +
      '</form>'
  end
  
end
