<%@ Page Language="C#" AutoEventWireup="true" CodeFile="amp-template.aspx.cs" Inherits="comuns_noticias_AMP_widgets_cxense_amp_template" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
    // Async load of cx.js
    (function(d,s,e,t){e=d.createElement(s);e.type='text/java'+s;e.async='async';
    e.src='http'+('https:'===location.protocol?'s://s':'://')+'cdn.cxense.com/cx.js';
    t=d.getElementsByTagName(s)[0];t.parentNode.insertBefore(e,t);})(document,'script');
</script>
<style type="text/css">
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, button, textarea, p, blockquote, th, td {
  margin: 0;
  padding: 0;
  /* height: 0;
  width: 0; */
}
</style>
</head>
<body>
<script type="text/javascript">
  var previousHeight = -1;
  var sendParentResizeMessage = function() {
    var height = previousHeight == -1 ? document.body.scrollHeight : document.body.offsetHeight;
    var message = {
      sentinel: 'amp',
      type: 'embed-size',
      height: height
    };
    if (previousHeight !== message.height) {
      previousHeight = message.height;
      window.parent.postMessage(message,"*");
    }
    setTimeout(sendParentResizeMessage, 250);
  };
  var getParameter = function(key) {
    var str = window.location.href.split("?");
    if (str.length < 2) {
      return "";
    }
    var params = str[1].split("&");
    for (var i = 0; i < params.length; i++) {
      var keyVal = params[i].split("=");
      if (keyVal[0] == key && keyVal.length == 2) {
        return decodeURIComponent(keyVal[1]);
      }
    }
    return "";
  };
</script>
<!-- Cxense content widget -->
<div id="cx_widget_placeholder" style="display:none"></div>
<script type="text/javascript">
  var cX = cX || {}; cX.callQueue = cX.callQueue || [];
  cX.callQueue.push(['invoke', function() {
    var widgetId = getParameter("widgetId");
      var ctx = getParameter("ctx");
      console.log('cxense teste widget client ');
    cX.insertWidget({
      widgetId:widgetId, ctx: ctx,
      insertBeforeElementId: 'cx_widget_placeholder',
      width: '100%', height: 100, renderTemplateUrl: 'auto',
      onImpressionResult: sendParentResizeMessage
    });
  }]);
</script>
<!-- End of Cxense content widget -->
</body>
</html>