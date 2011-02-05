var worker = new Worker("http://workerapp.heroku.com/javascripts/worker.js");
worker.postMessage("workerapp.heroku.com", "API_KEY");
