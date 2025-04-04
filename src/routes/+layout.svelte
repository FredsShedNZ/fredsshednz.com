<!-- src/routes/+layout.svelte -->
<script>
  import "../app.css";
  import { onMount } from 'svelte';
  import { fade } from 'svelte/transition';
  
  let isLoaded = false;
  
  onMount(() => {
    isLoaded = true;
  });
</script>

{#if isLoaded}
  <div in:fade={{ duration: 700 }}>
    <slot />
  </div>
{:else}
  <div class="h-screen flex items-center justify-center bg-primary">
    <div class="animate-pulse text-white text-2xl">
      Loading Fred's Shed NZ...
    </div>
  </div>
{/if}
