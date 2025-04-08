<!-- src/lib/components/ContactSection.svelte -->
<script>
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
</script>

<style>
  .contact-row {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    margin-bottom: 4rem;
  }
  
  @media (min-width: 768px) {
    .contact-row {
      flex-direction: row;
      justify-content: space-between;
    }
  }
  
  .contact-col {
    width: 100%;
    display: flex;
    flex-direction: column;
  }
  
  @media (min-width: 768px) {
    .contact-col {
      width: 47%;
    }
  }
  
  .content-box {
    background: white;
    border-radius: 0.5rem;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    height: 320px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .content-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  }
  
  .email-container {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .email-image {
    max-width: 85%;
    max-height: 250px;
    object-fit: contain;
  }
  
  .social-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 1rem;
    width: 100%;
    height: 100%;
    padding: 0.75rem;
  }
  
  .social-item {
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.2s;
  }
  
  .social-item:hover {
    transform: scale(1.05);
  }
  
  .social-image {
    max-width: 85%;
    max-height: 100px;
    object-fit: contain;
  }
  
  .caption {
    text-align: center;
    margin-top: 1.25rem;
    display: block;
    font-size: 1rem;
    color: #2C3E50;
    height: 1.5rem;
    line-height: 1.5rem;
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
      <!-- Email tile -->
      <div class="contact-col">
        <div class="content-box">
          <a href={emailContact.url} class="email-container">
            <img 
              src={emailContact.logoSrc} 
              alt="Email logo"
              class="email-image" 
            />
          </a>
        </div>
        <a href={emailContact.url} class="caption">
          Email me at {emailContact.description}
        </a>
      </div>
      
      <!-- Social media tile -->
      <div class="contact-col">
        <div class="content-box">
          <div class="social-grid">
            {#each dmContacts as contact}
              <a 
                href={contact.url} 
                target="_blank" 
                rel="noopener noreferrer" 
                class="social-item"
                aria-label={`Message on ${contact.name}`}
              >
                <img 
                  src={contact.logoSrc} 
                  alt={`${contact.name} logo`}
                  class="social-image" 
                />
              </a>
            {/each}
          </div>
        </div>
        <div class="caption">
          DM me on any social platform
        </div>
      </div>
    </div>
    
    <div class="mt-8 text-center text-lg">
      <p>Feedback you'd rather give privately? Questions about a project? Collaboration ideas? Just want to say Hi?</p>
      <p class="text-secondary font-medium mt-2">I'd love to hear from you! Take your pick of methods above :)</p>
    </div>
  </div>
</section>
