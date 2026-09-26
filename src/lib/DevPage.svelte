<!-- This is a useful little debugger tool for the
     Supabase connection stuff -->

<script lang="ts">
    import DevWidget from "./DevWidget.svelte"
    import DevButton from "./DevButton.svelte"
    import TextInput from "./TextInput.svelte"
    import Modal from "./Modal.svelte"

    let popup: Boolean = $state(false)

    function togglePopup() {
      if (popup) {
        popup = false
      } else {
        popup = true
      }
    }

</script>

<h1 class="text-2xl mb-4 text-red-400 text-center">
	Dev Mode
</h1>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 p-4">
	<DevWidget title="Sign Up">
		<TextInput type="email" placeholder="email"/>
		<TextInput type="password" placeholder="password"/>
		<DevButton title="Sign up"></DevButton>
	</DevWidget>

	<DevWidget title="Sign In">
		<TextInput type="email" placeholder="email"/>
		<TextInput type="password" placeholder="password"/>
		<DevButton title="Sign in"></DevButton>
	</DevWidget>

	<DevWidget title="Sign Out">
		<DevButton title="Sign out"></DevButton>
	</DevWidget>

	<DevWidget title="Project">
		<TextInput type="text" placeholder="project title"/>
		<DevButton title="Create project"></DevButton>
		<DevButton title="List my projects"></DevButton>
	</DevWidget>

	<DevWidget title="Tasks">
		<TextInput type="text" placeholder="task title"/>
		<DevButton title="Create tasks"></DevButton>
		<DevButton title="List my tasks"></DevButton>
	</DevWidget>

	<DevWidget title="Test Modal Popup">
		<DevButton onclick={togglePopup} title="Create modal Popup"></DevButton>
		<Modal bind:modalVisible={popup}>
		    <DevWidget title="Modal Test Popup">
				<p>Here's some text, but updated</p>
			</DevWidget>
		</Modal>

	</DevWidget>
</div>
