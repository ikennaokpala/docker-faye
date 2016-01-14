# An NPM base faye server running within a docker container

A Docker container for publish/subscribe messaging. This server can repond to requests from any client implementation from backend server or a CORS support enabled web browser. This best suites development purposes.

To build this faye server run the following command:

```bash
$ docker build --tag=faye ikennaokpala/docker-faye/
```

This will run on a default port of 9292.

To change the PORT for this run the following command:

```bash
$ docker build --build-arg PORT=9292 --tag=faye ikennaokpala/docker-faye/
```

To run the server and expose it on port 9292 of the host machine, run the following command:

```bash
$ docker run --name=faye --detach=true --publish=9292:9292 faye
```

Once the script is loaded, clients can then publish or subscribe to any arbitrary channel.

```javascript
// Create client
var client = new Faye.Client('http://localhost:9292/faye');

// Subscribe to an arbitrary channel /sample
client.subscribe('/sample', function(message) {
  console.log('Received ' + message.text);
});

// Publish to an arbitrary channel /sample on which existing subscribers will receive the message
client.publish('/sample', {
  text: 'Ahoy! There..'
});

```
