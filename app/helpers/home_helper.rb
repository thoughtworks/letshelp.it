module HomeHelper
  
  def generate_locale_menu_html
    '<div id="locale_menu">' +
      '<form method="get">' +
        select_tag("locale", options_for_select(I18n.available_locales.collect{ |x| [I18n.find_locale_name(x), x]}, I18n.locale), { :onchange => "this.form.submit()"}) +
      '</form>' +
    '</div>'
  end
  
end
