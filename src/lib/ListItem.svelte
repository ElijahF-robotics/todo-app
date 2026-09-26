<script>
    let { item } = $props();
</script>

<li class="flex flex-row items-center gap-4 py-2 w-full border-b border-gray-300 ">
    <input type="checkbox" class="w-5 h-5 cursor-pointer not-checked rounded-sm checked:bg-blue-200 border-slate-300" />
    <span class="w-full">{item}</span>
</li>
