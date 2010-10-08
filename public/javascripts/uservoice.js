var uservoiceOptions = {
  /* required */
  key: 'letshelpit',
  host: 'letshelpit.uservoice.com', 
  forum: '71821',
  showTab: true,  
  /* optional */
  alignment: 'right',
  background_color:'#331200', 
  text_color: 'white',
  hover_color: '#553422',
  lang: $('#body_tag').attr('lang').replace('-','_')
};

function _loadUserVoice() {
  var s = document.createElement('script');
  s.setAttribute('type', 'text/javascript');
  s.setAttribute('src', ("https:" == document.location.protocol ? "https://" : "http://") + "cdn.uservoice.com/javascripts/widgets/tab.js");
  document.getElementsByTagName('head')[0].appendChild(s);
}
_loadSuper = window.onload;
window.onload = (typeof window.onload != 'function') ? _loadUserVoice : function() { _loadSuper(); _loadUserVoice(); };
