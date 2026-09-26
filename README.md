# To-Do App

Database design in Supabase:

auth.users (Supabase gives us this):
 - ID : UUID()
 - email : string
 - phone : string
 - 2FA : Supabase takes care of this column

task:
 - ID : UUID()
 - title : string
 - notes : paragraph
 - layer : float - represents sorting order
 - due_date : date
 - project : FK to project
 - completed : bool
 - created_at : timestampz
 - updated_at : timestampz

project:
 - id : UUID()
 - title : string
 - notes : paragraph
 - color : string
 - icon : string
 - created_at : timestampz
 - updated_at : timestampz

 tag:
  - id : UUID()
  - title : string
  - color : string
  - created_at : timestampz
  - updated_at : timestampz

task_tags:
 - Task_ID : FK to a task
 - Tag_ID : FK to a tag
