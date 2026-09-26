<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';
	import SideBar from '$lib/SideBar.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>

<div class="flex flex-row min-h-screen">
    {@render children()}
</div>
