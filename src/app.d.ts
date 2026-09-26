import type { SupabaseClient } from '@supabase/supabase-js'
import type { Database } from './database.types'

// See https://svelte.dev/docs/kit/types#app.d.ts
// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		// interface Locals {}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
	}
}

declare global {
  namespace App {
    // interface Error {}
    interface Locals {
      supabase: SupabaseClient<Database>
    }
    // interface PageState {}
    // interface Platform {}
  }
}

export {}
