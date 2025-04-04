<!-- src/lib/components/FollowSection.svelte -->
<script>
  import ServiceTile from './ServiceTile.svelte';
  
  const followServices = [
    {
      name: 'Instagram',
      url: 'https://www.instagram.com/fredsshed.nz',
      logoSrc: '/images/instagram-logo.png',
      description: 'Project photos and workshop life'
    },
    {
      name: 'X (Twitter)',
      url: 'https://x.com/FredsShedNZ',
      logoSrc: '/images/x-logo.png',
      description: 'Updates and wood/engineering news'
    },
    {
      name: 'Facebook',
      url: 'https://www.facebook.com/FredsShedNZ',
      logoSrc: '/images/facebook-logo.png',
      description: 'Community and event announcements'
    },
    {
      name: 'Telegram',
      url: 'https://t.me/FredsShedNZ',
      logoSrc: '/images/telegram-logo.png',
      description: 'Quick tips and exclusive content'
    }
  ];
</script>

<section id="follow" class="py-16 bg-white">
  <div class="section-container">
    <h2 class="section-title flex items-center">
      <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M17 21V19C17 16.7909 15.2091 15 13 15H5C2.79086 15 1 16.7909 1 19V21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M9 11C11.2091 11 13 9.20914 13 7C13 4.79086 11.2091 3 9 3C6.79086 3 5 4.79086 5 7C5 9.20914 6.79086 11 9 11Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M23 21V19C22.9986 17.1771 21.7078 15.5857 20 15.13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M16 3.13C17.7160 3.58137 19.0085 5.17565 19.0085 7.005C19.0085 8.83436 17.7160 10.4286 16 10.88" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      Follow
    </h2>
    
    <div class="tile-grid">
      {#each followServices as service}
        <ServiceTile 
          name={service.name} 
          url={service.url} 
          logoSrc={service.logoSrc} 
          description={service.description}
        />
      {/each}
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Follow for daily updates and to join our growing community of makers!</p>
    </div>
  </div>
</section>
