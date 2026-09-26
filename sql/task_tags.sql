-- This is written by Claude

create table public.task_tag (
    task_id     uuid not null references public.task(id) on delete cascade,
    tag_id      uuid not null references public.tag(id) on delete cascade,
    created_at  timestamptz not null default now(),
    primary key (task_id, tag_id)
);

create index task_tag_tag_id_idx on public.task_tag (tag_id);

alter table public.task_tag enable row level security;

create policy "select own task_tags"
  on public.task_tag for select
  using (
    exists (
      select 1 from public.task
      where task.id = task_tag.task_id
      and task.user_id = auth.uid()
    )
  );

create policy "insert own task_tags"
  on public.task_tag for insert
  with check (
    exists (
      select 1 from public.task
      where task.id = task_tag.task_id
      and task.user_id = auth.uid()
    )
  );

create policy "delete own task_tags"
  on public.task_tag for delete
  using (
    exists (
      select 1 from public.task
      where task.id = task_tag.task_id
      and task.user_id = auth.uid()
    )
  );
