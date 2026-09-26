<!-- Written by Claude -->

<script lang="ts">
	let { githubUrl = 'https://github.com/ElijahF-robotics/todo-app/tree/main' }: { githubUrl?: string } = $props();
</script>

<div
	class="min-h-screen w-full flex items-center justify-center px-8 py-8 box-border
	       bg-[radial-gradient(circle_at_50%_0%,#1e293b_0%,#0f172a_60%,#020617_100%)] text-slate-200"
>
	<div class="max-w-lg text-center flex flex-col items-center gap-5">
		<span
			class="text-sm font-semibold tracking-wide rounded-full px-4 py-1.5
			       bg-yellow-400/10 text-yellow-400 border border-yellow-400/30"
		>
			🚧 Under Construction
		</span>

		<h1 class="text-3xl sm:text-4xl font-bold m-0 text-slate-50">
			This page isn't ready yet
		</h1>

		<p class="m-0 text-base leading-relaxed text-slate-400">
			The main site is still being built out. If you're curious what's underneath, the
			project is open source — check it out on GitHub.
		</p>

		<a
			href={githubUrl}
			target="_blank"
			rel="noopener noreferrer"
			class="mt-2 inline-flex items-center gap-2 rounded-lg px-6 py-2.5 font-semibold
			       bg-slate-50 text-slate-900 no-underline transition
			       hover:bg-slate-200 hover:-translate-y-0.5"
		>
			View on GitHub
			<svg viewBox="0 0 16 16" width="16" height="16" fill="currentColor" aria-hidden="true">
				<path
					d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38
					   0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13
					   -.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66
					   .07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15
					   -.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0
					   1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82
					   1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01
					   1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8z"
				/>
			</svg>
		</a>
	</div>
</div>
