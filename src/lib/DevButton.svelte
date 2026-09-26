<script>
    let {onclick=console.log("Button Pressed"), title} = $props()
</script>

<button onclick={onclick} class="bg-gray-200 hover:bg-gray-300 active:bg-gray-400 cursor-pointer rounded-lg px-2 py-1">{title}</button>
