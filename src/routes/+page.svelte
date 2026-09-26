<script lang="ts">
    import type { Option } from '$lib/types';
    import List from '$lib/List.svelte';
    import SideBar from '$lib/SideBar.svelte';
    import SelectedPage from '$lib/SelectedPage.svelte';

    let selectedOption: Option = $state('Today');
</script>

<!-- Render the Sidebar most left -->
<SideBar bind:selectedOption={selectedOption}/>

<!-- Render the main page -->
<SelectedPage bind:selectedOption={selectedOption} />
