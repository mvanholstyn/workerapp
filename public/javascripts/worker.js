var $ = function() {};

$.prototype.ajax = { 
  createXHR: function() { 
    return new XMLHttpRequest(); 
  }, 
  configXHR: function(connector, callback) { 
    connector.onreadystatechange = function() { 
      if (connector.readyState == 4) { 
        if (connector.status == 200) { 
          callback.call(connector, { 
            text: connector.responseText, 
            xml: connector.responseXML,
            json: eval('(' + connector.responseText + ')')
          }); 
        } 
      } 
    } 
  }, 
  get: function(request) { 
    var url       = request.url || ''; 
    var callback  = request.callback || function() {}; 
    var data      = request.data || ''; 
    var xhr = this.createXHR(); 

    if (xhr) { 
      this.configXHR(xhr, callback); 
      xhr.open('GET', url, true); 
      xhr.send(data); 
    } 
  }, 
  post: function(request) { 
    var url       = request.url || ''; 
    var callback  = request.callback || function() {}; 
    var data      = request.data || ''; 
    var xhr       = this.createXHR(); 

    if (xhr) { 
      this.configXHR(xhr, callback); 
      xhr.open('POST', url, true); 
      xhr.setRequestHeader('Content type', 'application/x-www-form-urlencoded'); 
      xhr.setRequestHeader('Content-length', data.length); 
      xhr.setRequestHeader('Connection', 'close'); 
      xhr.send(data); 
    } 
  } 
} 
$ = new $();

var executeTask = function(host, api_key) {
  $.ajax.get({
    url: "http://" + host + "/tasks/next.json?api_key=" + api_key, 
    // data: { api_key: api_key },
    callback: function(response) {
      //if(response.json.nodata){
        postMessage(response.json.nodata);
      //};
      var fn = eval("(" + response.json.fn + ")");
      var result = fn(response.json.data);
      $.ajax.get({ 
        url: "http://" + host + "/tasks/result.json?api_key=" + api_key + "&id=" + response.json.id + "&result=" + result, 
        // data: { api_key: api_key, result: result },
        callback: function(response){
          executeTask(host, api_key);
        }
      });
    }
  });
};


onmessage = function(e){
  var host = e.data[0];
  var api_key = e.data[1];
  executeTask(host, api_key);
};
