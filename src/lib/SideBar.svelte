<script lang="ts">
    import { OPTIONS } from '$lib/types';
    import type { Option } from '$lib/types';

    let { selectedOption = $bindable('Inbox') } = $props();

    function selectOption(option: Option) {
        selectedOption = option;
    }
</script>

<div class="flex flex-col min-w-1/4 min-h-full bg-slate-600 p-6 gap-4">
    {#each OPTIONS as option}
        <button onclick={() => selectOption(option)} class="transition text-lg hover:scale-105 font-medium cursor-pointer p-2 rounded-lg hover:bg-slate-500 w-full flex flex-row items-center {option === selectedOption ? 'bg-slate-400 text-white' : 'text-slate-400'}">{option}</button>
    {/each}
</div>
