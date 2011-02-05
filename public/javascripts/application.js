var worker = new Worker("/javascripts/worker.js");
worker.onmessage = function(e) { alert(e.data); };
worker.postMessage([window.location.host, "mark-key"]);
