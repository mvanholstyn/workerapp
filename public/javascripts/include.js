alert("working...");
var worker = new Worker("/javascripts/worker.js");
alert(worker);
worker.onmessage = function(e) {
  alert(e.data);
};
worker.postMessage(["junk", "API_KEY"]);
