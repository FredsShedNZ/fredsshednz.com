<!-- src/lib/components/ServiceTile.svelte -->
<script>
  export let name = '';
  export let url = '';
  export let logoSrc = '';
  export let description = '';
  export let backgroundColor = 'bg-white';
  export let textColor = 'text-primary';
</script>

<a 
  href={url} 
  target="_blank" 
  rel="noopener noreferrer" 
  class="service-tile {backgroundColor} {textColor}"
>
  <div class="p-6 flex flex-col items-center h-full">
    <img src={logoSrc} alt="{name} logo" class="service-logo mb-4" />
    <h3 class="text-xl font-bold mb-2">{name}</h3>
    {#if description}
      <p class="text-center text-sm opacity-80">{description}</p>
    {/if}
  </div>
</a>

<style>
  .service-tile {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .service-tile:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  }
  
  .service-logo {
    max-width: 80px;
    max-height: 80px;
  }
</style>
