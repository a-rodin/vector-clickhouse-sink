CREATE TABLE IF NOT EXISTS
fortune_log (host String, timestamp String, message String)
ENGINE = MergeTree()
PARTITION BY substring(timestamp, 1, 7)
ORDER BY (host, timestamp);
