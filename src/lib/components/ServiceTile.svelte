<!-- In ServiceTile.svelte -->
<script>
  export let name = '';
  export let url = '';
  export let logoSrc = '';
  export let type = '';
  export let description = '';
  export let backgroundColor = 'bg-white';
  
  export let logoSize = 'medium';
  export let preserveAspectRatio = true;
  
  // For debugging
  console.log('Received type:', type);
</script>

<a 
  href={url} 
  target="_blank" 
  rel="noopener noreferrer" 
  class="block {backgroundColor} rounded-lg shadow-lg overflow-hidden transition-transform duration-300 hover:scale-105 text-center p-6"
>
  <div class="flex flex-col items-center justify-between h-full">
    <div class="logo-container {logoSize === 'small' ? 'h-24' : logoSize === 'large' ? 'h-40' : 'h-32'}">
      <img 
        src={logoSrc} 
        alt="{name} logo" 
        class="max-h-full {preserveAspectRatio ? 'max-w-full' : 'w-full'} object-contain"
      />
    </div>
    
    <!-- Let's try simplifying the conditional logic -->
    {#if type === 'follow'}
      <p class="text-sm text-gray-600 mt-4">Follow on {name}</p>
    {:else if type === 'support'}
      <p class="text-sm text-gray-600 mt-4">Support on {name}</p>
    {:else if type === 'connect'}
      <p class="text-sm text-gray-600 mt-4">Connect on {name}</p>
    {:else if description != null}
      <p class="text-sm text-gray-600 mt-4">{description}</p>
    {:else}
      <p class="text-sm text-gray-600 mt-4">We're on {name} (type: {type})</p>
    {/if}
  </div>
</a>
