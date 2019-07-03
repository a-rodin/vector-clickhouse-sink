# Vector with ClickHouse sink

This is an example of using [ClickHouse](https://clickhouse.yandex) as a sink for [Vector](https://vector.dev). See [this issue](https://github.com/timberio/vector/issues/556) for more details.

It uses ClickHouse [HTTP API](https://clickhouse.yandex/docs/en/interfaces/http/) and Vector [HTTP sink](https://docs.vector.dev/usage/configuration/sinks/http) to move the data.

## Usage

Clone the repository and run

```sh
docker-compose up -d
```

It would start the following services:

* `service` - a service that generates text using [fortune](https://wiki.debian.org/fortune) and writes it to Vector using a TCP socket;
* `vector` - Vector configured to use a TCP source and HTTP/console sinks, the config file is in `vector.toml`.
* `clickhouse-server` - ClickHouse;
* `init-clickhouse` - a service that creates a table `service_log` in ClickHouse using `init-clickhouse.sql` file.

The logs would be generated and ingested to ClickHouse.

In order to see them, run

```sh
docker-compose run --rm clickhouse-client
```

and then make a query, for example

```sql
SELECT * FROM service_log LIMIT 10
```
