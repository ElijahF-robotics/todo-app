-- Elijah Flader

create table public.tag (
    id          uuid primary key default gen_random_uuid(),
    user_id     uuid not null references auth.users(id) on delete cascade,
    title       text not null,
    color       text,
    created_at  timestamptz not null default now(),
    updated_at  timestamptz not null default now()
);

-- Indexes
create index tag_user_id_idx on public.tag (user_id);

-- Keep updated_at up to updated_at
create trigger tag_set_updated_at
  before update on public.tag
  for each row execute function public.set_updated_at();

-- RLS
alter table public.tag enable row level security;

create policy "select own tags"
  on public.tag for select
  using (user_id = auth.uid());

create policy "insert own tags"
  on public.tag for insert
  with check (user_id = auth.uid());

create policy "update own tags"
  on public.tag for update
  using (user_id = auth.uid());

create policy "delete own tags"
  on public.tag for delete
  using (user_id = auth.uid());

-- Force tags to be unique
alter table public.tag
  add constraint tag_user_title_unique unique (user_id, title);
