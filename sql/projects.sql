-- Elijah Flader

create table public.project (
    id          uuid primary key default gen_random_uuid(),
    user_id     uuid not null references auth.users(id) on delete cascade,
    title       text not null,
    notes       text,
    color       text,
    icon        text,
    created_at  timestamptz not null default now(),
    updated_at  timestamptz not null default now()
);

-- indexes for the lookups
create index project_user_id_idx on public.project (user_id);

-- always update the updated_at attribute
create or replace function public.set_updated_at()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

create trigger project_updated_at
    before update on public.project
    for each row
    execute function public.set_updated_at();

-- RLS
alter table public.project enable row level security;

-- Allow user to update, select, insert and delete projects
create policy "select own projects"
  on public.project for select
  using (user_id = auth.uid());

create policy "insert own projects"
  on public.project for insert
  with check (user_id = auth.uid());

create policy "update own projects"
  on public.project for update
  using (user_id = auth.uid());

create policy "delete own projects"
  on public.project for delete
  using (user_id = auth.uid());

-- Force projects to be unique
alter table public.project
  add constraint project_user_title_unique unique (user_id, title);
