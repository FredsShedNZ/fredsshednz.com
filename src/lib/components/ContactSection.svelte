<!-- src/lib/components/ContactSection.svelte -->
<script>
  import ServiceTile from './ServiceTile.svelte';
  
  const emailContact = {
    name: 'Email',
    url: 'mailto:fredsshednz@proton.me',
    logoSrc: '/images/email-logo.png',
    description: 'fredsshednz@proton.me'
  };
  
  const dmContacts = [
    {
      name: 'Instagram DM',
      url: 'https://www.instagram.com/fredsshed.nz',
      logoSrc: '/images/instagram-mini-logo.png'
    },
    {
      name: 'Facebook DM',
      url: 'https://www.facebook.com/FredsShedNZ',
      logoSrc: '/images/facebook-mini-logo.png'
    },
    {
      name: 'X (Twitter) DM',
      url: 'https://x.com/FredsShedNZ',
      logoSrc: '/images/x-mini-logo.png'
    },
    {
      name: 'Patreon DM',
      url: 'https://www.patreon.com/FredsShed',
      logoSrc: '/images/patreon-mini-logo.png'
    }
  ];
</script>

<section id="contact" class="py-16 bg-background">
  <div class="section-container">
    <h2 class="section-title flex items-center">
      <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M4 4H20C21.1 4 22 4.9 22 6V18C22 19.1 21.1 20 20 20H4C2.9 20 2 19.1 2 18V6C2 4.9 2.9 4 4 4Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M22 6L12 13L2 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      Contact
    </h2>
    
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <!-- Email tile (takes up 2/3 width on md screens) -->
      <div class="md:col-span-2">
        <ServiceTile 
          name={emailContact.name} 
          url={emailContact.url} 
          logoSrc={emailContact.logoSrc} 
          description={emailContact.description}
        />
      </div>
      
      <!-- DM mini tiles container (takes up 1/3 width on md screens) -->
      <div class="grid grid-cols-2 grid-rows-2 gap-4">
        {#each dmContacts as contact}
          <a 
            href={contact.url} 
            target="_blank" 
            rel="noopener noreferrer" 
            class="bg-white rounded-lg shadow-md p-4 flex flex-col items-center justify-center transition-transform duration-200 hover:transform hover:scale-105"
          >
            <img src={contact.logoSrc} alt="{contact.name} logo" class="w-10 h-10 mb-2" />
            <span class="text-xs text-center font-medium">{contact.name}</span>
          </a>
        {/each}
      </div>
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Questions about a project? Collaboration ideas? Just want to say hello?</p>
      <p class="text-secondary font-medium mt-2">I'd love to hear from you!</p>
    </div>
  </div>
</section>
