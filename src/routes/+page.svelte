<script lang="ts">
    import type { Option } from '$lib/types';
    import List from '$lib/List.svelte';
    import SideBar from '$lib/SideBar.svelte';
    import SelectedPage from '$lib/SelectedPage.svelte';
	import UnderConstruction from '$lib/UnderConstruction.svelte';

    let selectedOption: Option = $state('Today');
</script>

<!-- Used on main branch to hide actual app -->
<!-- <UnderConstruction/> -->

<!-- Render the Sidebar most left -->
<SideBar bind:selectedOption={selectedOption}/>

<!-- Render the main page -->
<SelectedPage bind:selectedOption={selectedOption} />
