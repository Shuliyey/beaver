### Background
Beaver provides an lightweight method for shipping local log files to Logstash. It does this using redis, zeromq, tcp, udp, rabbit or stdout as the transport. This means you’ll need a redis, zeromq, tcp, udp, amqp or stdin input somewhere down the road to get the events.

Events are sent in logstash’s `json_event` format. Options can also be set as environment variables.

### Documentation
