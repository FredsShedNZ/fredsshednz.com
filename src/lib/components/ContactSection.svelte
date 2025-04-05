<!-- src/lib/components/ContactSection.svelte -->
<script>
  import { onMount } from 'svelte';
  
  const emailContact = {
    name: 'Email',
    url: 'mailto:fredsshednz@proton.me',
    logoSrc: '/images/email.png',
    description: 'fredsshednz@proton.me'
  };
  
  const dmContacts = [
    {
      name: 'Instagram',
      url: 'https://www.instagram.com/fredsshed.nz',
      logoSrc: '/images/instagram.png'
    },
    {
      name: 'Facebook',
      url: 'https://www.facebook.com/FredsShedNZ',
      logoSrc: '/images/facebook.png'
    },
    {
      name: 'X (Twitter)',
      url: 'https://x.com/FredsShedNZ',
      logoSrc: '/images/twitter.png'
    },
    {
      name: 'Patreon',
      url: 'https://www.patreon.com/FredsShed',
      logoSrc: '/images/patreon.png'
    }
  ];
  
  let emailContainer;
  let socialContainer;
  
  // Function to match heights
  function matchHeights() {
    if (emailContainer && socialContainer) {
      // Reset heights first
      emailContainer.style.height = 'auto';
      socialContainer.style.height = 'auto';
      
      // Get the natural heights
      const emailHeight = emailContainer.offsetHeight;
      const socialHeight = socialContainer.offsetHeight;
      
      // Set both to the larger of the two heights
      const maxHeight = Math.max(emailHeight, socialHeight);
      emailContainer.style.height = `${maxHeight}px`;
      socialContainer.style.height = `${maxHeight}px`;
    }
  }
  
  onMount(() => {
    // Match heights after component is mounted
    setTimeout(matchHeights, 100);
  });
</script>

<style>
  .contact-row {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    margin-bottom: 4rem;
  }
  
  .contact-col {
    width: 100%;
    display: flex;
    flex-direction: column;
  }
  
  .container {
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
    padding: 1.5rem;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .container:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  }
  
  .email-container {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .email-container img {
    max-width: 70%;
    height: auto;
    object-fit: contain;
  }
  
  .mini-tiles {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 1rem;
    height: 100%;
  }
  
  .mini-tile {
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.2s;
    padding: 0.5rem;
  }
  
  .mini-tile:hover {
    transform: scale(1.05);
  }
  
  .mini-tile img {
    width: 85%;
    object-fit: contain;
  }
  
  .description-text {
    text-align: center;
    font-size: 1rem;
    color: #2C3E50;
    margin-top: 1.5rem;
  }
  
  /* Media query for tablet and larger screens */
  @media (min-width: 768px) {
    .contact-row {
      flex-direction: row;
      align-items: flex-start;
    }
    
    .contact-col {
      width: 48%; /* Reduced from 50% to prevent overlap */
    }
    
    .contact-row {
      justify-content: space-between; /* Add space between columns */
    }
  }
</style>

<section id="contact" class="py-16 bg-background">
  <div class="section-container">
    <h2 class="section-title flex items-center">
      <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M4 4H20C21.1 4 22 4.9 22 6V18C22 19.1 21.1 20 20 20H4C2.9 20 2 19.1 2 18V6C2 4.9 2.9 4 4 4Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M22 6L12 13L2 6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      Contact
    </h2>
    
    <div class="contact-row">
      <!-- Email tile with description below -->
      <div class="contact-col">
        <a href={emailContact.url} class="container email-container" bind:this={emailContainer}>
          <img src={emailContact.logoSrc} alt="Email logo" />
        </a>
        <a href={emailContact.url} class="description-text">
          Email me at {emailContact.description}
        </a>
      </div>
      
      <!-- Mini-tiles container with description below -->
      <div class="contact-col">
        <div class="container" bind:this={socialContainer}>
          <div class="mini-tiles">
            {#each dmContacts as contact}
              <a 
                href={contact.url} 
                target="_blank" 
                rel="noopener noreferrer" 
                class="mini-tile"
                aria-label={`Message on ${contact.name}`}
              >
                <img src={contact.logoSrc} alt={`${contact.name} logo`} />
              </a>
            {/each}
          </div>
        </div>
        <p class="description-text">DM me on any social platform</p>
      </div>
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Feedback you'd rather give privately? Questions about a project? Collaboration ideas? Just want to say Hi?</p>
      <p>I'd love to hear from you! Take your pick of methods above :-)</p>
    </div>
  </div>
</section>

<svelte:window on:resize={matchHeights}/>
