<!-- src/lib/components/SupportSection.svelte -->
<script>
  import ServiceTile from './ServiceTile.svelte';
  
  const supportServices = [
    {
      name: 'Patreon',
      url: 'https://www.patreon.com/FredsShed',
      logoSrc: '/images/patreon.png'
    },
    {
      name: 'PayPal',
      url: 'https://paypal.me/fredsshednz',
      logoSrc: '/images/paypal.png'
    },
    {
      name: 'Buy Me a Coffee',
      url: 'https://www.buymeacoffee.com/fredsshednz',
      logoSrc: '/images/buymeacoffee.png'
    },
    {
      name: 'Ko-fi',
      url: 'https://ko-fi.com/fredsshednz',
      logoSrc: '/images/kofi.png'
    }
  ];
</script>

<section id="support" class="py-16 bg-white">
  <div class="section-container">
    <h2 class="section-title flex items-center">
      <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M15 9H9V15H15V9Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      Support
    </h2>
    
    <div class="tile-grid">
      {#each supportServices as service}
        <ServiceTile 
          name={service.name} 
          url={service.url} 
          logoSrc={service.logoSrc} 
          type="support"
          textColor="text-primary"
        />
      {/each}
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Your support helps keep the lights on, the tools sharp, and projects coming!</p>
      <p class="mt-2 text-secondary-light">Every contribution goes directly toward tools, materials, camera gear, red wine, and cold cider!</p>
    </div>
  </div>
</section>
