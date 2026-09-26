<script>
    let { children, title } = $props();
</script>

<div class="bg-gray-100 rounded-lg p-4 flex flex-col gap-4">
    <h2 class="font-bold">{title}</h2>
    {@render children()}
</div>
