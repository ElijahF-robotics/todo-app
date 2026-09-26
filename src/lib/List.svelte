<script>
    import ListItem from "$lib/ListItem.svelte"

    let { items } = $props();
</script>

<ul class="flex flex-col w-full">
    {#each items as item}
        <ListItem item={item} />
    {/each}
</ul>
