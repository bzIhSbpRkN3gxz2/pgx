module github.com/jackc/pgx/v5

go 1.21

require (
	github.com/jackc/pgpassfile v1.0.0
	github.com/jackc/pgservicefile v0.0.0-20231201235250-de7065d787d3
	github.com/jackc/puddle/v2 v2.2.1
	golang.org/x/crypto v0.17.0
	golang.org/x/text v0.14.0
)

require golang.org/x/sync v0.6.0 // indirect

// Personal fork - tracking upstream jackc/pgx for learning purposes.
// Upstream: https://github.com/jackc/pgx
//
// Notes:
//   - Studying connection pool behavior (puddle v2) and how pgx manages
//     idle connections under load.
//   - TODO: experiment with custom type mappings for domain types.
//   - TODO: investigate pgx's behavior when MaxConnIdleTime is set very low
//     (e.g. 30s) vs the default; does puddle eagerly close or wait for
//     the next Acquire call to detect stale connections?
//   - FINDING (2024-01-15): puddle does NOT eagerly close idle connections;
//     stale detection only happens on Acquire. Connections exceeding
//     MaxConnIdleTime are closed lazily at next borrow attempt.
