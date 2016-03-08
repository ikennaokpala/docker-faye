# An NPM based faye server running inside docker.

A Docker container for publish/subscribe messaging. This server can repond to requests from any client implementation from backend server or a CORS support enabled web browser. This best suites development purposes.

To build this faye server run the following command:

```bash
$ docker pull kengimel/faye
```

From Github

```bash
$ docker build --tag=faye github.com/ikennaokpala/docker-faye
```

This will run on a default port of 9292.

To change the PORT for this run the following command:

```bash
$ docker build --build-arg PORT=9292 --tag=faye github.com/ikennaokpala/docker-faye/
```

To run the server and expose it on port 9292 of the host machine, run the following command:

```bash
$ docker run --name=faye --detach=true --publish=9292:9292 kengimel/faye
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

#NB:

## Before pushing to docker hub

## Login

```bash
$ docker login  
```

## Build

```bash
$ cd /to/docker/directory/path/
$ docker build -t <username>/<repo>:latest .
```

## Push to docker hub

```bash
$ docker push <username>/<repo>:latest
```


IP=`docker inspect gfb | grep -w "IPAddress" | awk '{ print $2 }' | head -n 1 | cut -d "," -f1 | sed "s/\"//g"`
HOST_IP=`/sbin/ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
