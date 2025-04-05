<!-- src/lib/components/WatchSection.svelte -->
<script>
  import ServiceTile from './ServiceTile.svelte';
  
  const watchServices = [
    {
      name: 'YouTube',
      url: 'https://youtube.com/@FredsShedNZ',
      logoSrc: '/images/youtube.png',
      description: 'Watch full both long and short videos'
    },
    {
      name: 'TikTok',
      url: 'https://www.tiktok.com/@fredsshed.nz',
      logoSrc: '/images/tiktok.png',
      description: 'Watch only short form videos here'
    }
  ];
</script>

<section id="watch" class="py-16 bg-gradient-to-br from-background to-background-dark">
  <div class="section-container">
    <h2 class="section-title flex items-center">
      <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 8V16M8 12H16" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
      </svg>
      Watch
    </h2>
    
    <div class="tile-grid">
      {#each watchServices as service}
        <ServiceTile 
          name={service.name} 
          url={service.url} 
          logoSrc={service.logoSrc} 
          description={service.description}
        />
      {/each}
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Subscribe to see the latest project, tips and tricks, adventure, and shop update videos!</p>
    </div>
  </div>
</section>
