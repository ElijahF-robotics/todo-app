<script lang="ts">
    import List from '$lib/List.svelte';
    import DevPage from '$lib/DevPage.svelte';
    import type { Option } from '$lib/types';

    let items = ['Item 1', 'Item 2', 'Item 3'];
    let { selectedOption = $bindable('Today') } = $props();
</script>

<div class="flex flex-col min-h-full px-8 pt-6 w-full">
    {#if selectedOption === 'DEV'}
        <DevPage />

    {:else}
        <h1 class="text-2xl mb-4">{selectedOption}</h1>

        <List items={items} />
    {/if}
</div>
