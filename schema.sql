-- Ejecutar en Supabase: SQL Editor > New query > Run
create table public.wheels (
  id uuid primary key default gen_random_uuid(),
  name text not null default 'Nueva ruleta',
  items jsonb not null default '[]'::jsonb,
  item_count int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.wheels enable row level security;

-- Acceso público total (cualquiera con el link puede ver, crear, editar y borrar)
create policy "leer"   on public.wheels for select using (true);
create policy "crear"  on public.wheels for insert with check (true);
create policy "editar" on public.wheels for update using (true) with check (true);
create policy "borrar" on public.wheels for delete using (true);
