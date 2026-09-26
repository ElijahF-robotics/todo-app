<script lang="ts">
    import { fly, fade } from 'svelte/transition'

    let {children, modalVisible=$bindable()} = $props()

    function handleKeydown(e: KeyboardEvent) {
      if (e.key === 'Escape') modalVisible = false
    }

    $effect(() => {
        if (modalVisible) {
            document.body.classList.add('overflow-hidden')
        } else {
            document.body.classList.remove('overflow-hidden')
        }

        return () => {
            document.body.classList.remove('overflow-hidden')
        }
    })
</script>

<svelte:window onkeydown={handleKeydown} />

{#if modalVisible}
<!-- svelte-ignore a11y_click_events_have_key_events -->
<!-- svelte-ignore a11y_no_static_element_interactions -->
<div
    onclick={() => {modalVisible = false}}
    transition:fade={{ duration: 350 }}
    class="fixed inset-0 bg-black/50 backdrop-blur-sm w-screen h-screen z-10">
    <div class="flex items-center justify-center h-full z-20">
        <div
            onclick={(e) => e.stopPropagation()}
            transition:fly={{ y: 200, duration: 350 }}
            class="shadow-2xl shadow-gray-600"
        >
            {@render children()}
        </div>
    </div>
</div>
{/if}
