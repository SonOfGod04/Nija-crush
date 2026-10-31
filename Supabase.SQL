-- Naija Crush: run this once in Supabase > SQL Editor (safe to re-run)

create table if not exists players (
  id text primary key,
  name text not null check (char_length(name) between 1 and 14),
  tot int not null default 0,
  m int not null default 0,
  don int not null default 0,
  vp int not null default 0,
  ts timestamptz not null default now()
);
alter table players add column if not exists save jsonb;
alter table players add column if not exists sid text;
-- nicknames are unique, ignoring upper/lower case
create unique index if not exists players_name_unique on players (lower(name));

create table if not exists help_requests (
  id uuid primary key default gen_random_uuid(),
  pid text not null,
  name text not null check (char_length(name) between 1 and 14),
  reason text not null check (char_length(reason) <= 60),
  need int not null check (need between 50 and 500),
  open boolean not null default true,
  ts timestamptz not null default now()
);
create unique index if not exists one_open_request on help_requests (pid) where open;

create table if not exists gifts (
  id uuid primary key default gen_random_uuid(),
  req_id uuid not null references help_requests(id) on delete cascade,
  to_pid text not null,
  from_name text not null check (char_length(from_name) between 1 and 14),
  amount int not null check (amount between 10 and 500),
  claimed boolean not null default false,
  ts timestamptz not null default now()
);
alter table gifts add column if not exists from_pid text;

alter table players enable row level security;
alter table help_requests enable row level security;
alter table gifts enable row level security;

-- remove the older open policies if they exist
drop policy if exists "players read" on players;
drop policy if exists "players insert" on players;
drop policy if exists "players update" on players;
drop policy if exists "requests read" on help_requests;
drop policy if exists "requests insert" on help_requests;
drop policy if exists "requests update" on help_requests;
drop policy if exists "gifts read" on gifts;
drop policy if exists "gifts insert" on gifts;
drop policy if exists "gifts update" on gifts;
drop policy if exists "players insert own" on players;
drop policy if exists "players update own" on players;
drop policy if exists "requests insert own" on help_requests;
drop policy if exists "requests update own" on help_requests;
drop policy if exists "gifts insert own" on gifts;
drop policy if exists "gifts claim own" on gifts;

-- everyone can read; only a signed-in player can write their own rows
create policy "players read" on players for select using (true);
create policy "players insert own" on players for insert to authenticated
  with check (id = auth.uid()::text);
create policy "players update own" on players for update to authenticated
  using (id = auth.uid()::text) with check (id = auth.uid()::text);

create policy "requests read" on help_requests for select using (true);
create policy "requests insert own" on help_requests for insert to authenticated
  with check (pid = auth.uid()::text);
create policy "requests update own" on help_requests for update to authenticated
  using (pid = auth.uid()::text) with check (pid = auth.uid()::text);

create policy "gifts read" on gifts for select using (true);
create policy "gifts insert own" on gifts for insert to authenticated
  with check (from_pid = auth.uid()::text and to_pid <> auth.uid()::text);
create policy "gifts claim own" on gifts for update to authenticated
  using (to_pid = auth.uid()::text) with check (to_pid = auth.uid()::text);

-- receivers may only flip "claimed", requesters may only close their request
revoke update on gifts from authenticated;
grant update (claimed) on gifts to authenticated;
revoke update on help_requests from authenticated;
grant update (open) on help_requests to authenticated;
