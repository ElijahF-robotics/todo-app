-- This script is written by Claude

create table public.task (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users(id) on delete cascade,
  project     uuid references public.project(id) on delete set null,
  title       text not null,
  notes       text,
  layer       double precision not null default 0,
  due_date    date,
  completed   boolean not null default false,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- indexes for the lookups
create index task_user_id_idx on public.task (user_id);
create index task_project_idx on public.task (project);

-- keep updated_at honest on every edit
create trigger task_set_updated_at
  before update on public.task
  for each row execute function public.set_updated_at();

-- RLS: lock rows to their owner
alter table public.task enable row level security;

create policy "select own tasks"
  on public.task for select
  using (user_id = auth.uid());

create policy "insert own tasks"
  on public.task for insert
  with check (user_id = auth.uid());

create policy "update own tasks"
  on public.task for update
  using (user_id = auth.uid());

create policy "delete own tasks"
  on public.task for delete
  using (user_id = auth.uid());
