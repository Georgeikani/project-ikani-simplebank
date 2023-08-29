CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "Account_id" bigint NOT NULL,
  "Amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_Account_id" bigint NOT NULL,
  "to_Account_id" bigint NOT NULL,
  "Amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "transfers" ("from_Account_id");

CREATE INDEX ON "transfers" ("to_Account_id");

CREATE INDEX ON "transfers" ("from_Account_id", "to_Account_id");

COMMENT ON COLUMN "entries"."Amount" IS 'can be negative or positive';

COMMENT ON COLUMN "transfers"."Amount" IS 'must positive or negative';

ALTER TABLE "entries" ADD FOREIGN KEY ("Account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_Account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_Account_id") REFERENCES "accounts" ("id");
