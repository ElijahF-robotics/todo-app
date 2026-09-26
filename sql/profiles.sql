-- Claude wrote this

-- This file is for a specific functionality I needed, namely a way to store
-- whether someone had access to dev tools. This script not only creates the
-- necessary store, it also protects dev from client side editing to keep my
-- dev page secure. If you want the dev page just enable on the Supabase side.
-- Since I needed this I also went ahead and added a name value, just for
-- niceness

-- 1. Table
create table public.profile (
  id uuid primary key references auth.users(id) on delete cascade,
  name text,
  dev boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- 2. RLS
alter table public.profile enable row level security;

create policy "Users can view their own profile"
  on public.profile for select
  using (auth.uid() = id);

create policy "Users can insert their own profile"
  on public.profile for insert
  with check (auth.uid() = id);

create policy "Users can update their own profile"
  on public.profile for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- 3. Trigger: protect `dev` from client-side writes.
-- auth.role() returns 'service_role' when the request is made with your
-- service role key (server-side only) or by a database owner/trigger context
-- that bypasses RLS; anon/authenticated requests never satisfy this.
create or replace function public.protect_dev_flag()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.role() <> 'service_role' then
    new.dev := old.dev;
  end if;
  new.updated_at := now();
  return new;
end;
$$;

create trigger protect_dev_flag_trigger
  before update on public.profile
  for each row
  execute function public.protect_dev_flag();
