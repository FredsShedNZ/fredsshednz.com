<!-- src/lib/components/Header.svelte -->
<script>
  import { fade } from 'svelte/transition';

  let sections = [
    { id: 'watch', label: 'Watch' },
    { id: 'follow', label: 'Follow' },
    { id: 'support', label: 'Support' },
    { id: 'contact', label: 'Contact' }
  ];
  
  let isMenuOpen = false;
  
  function toggleMenu() {
    isMenuOpen = !isMenuOpen;
  }
  
  function closeMenu() {
    isMenuOpen = false;
  }
</script>

<style>
  .header-container {
    position: sticky;
    top: 0;
    z-index: 50;
    background-color: #2C3E50;
    padding: 1rem 0;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  }
  
  .header-content {
    background: white;
    border-radius: 0.5rem;
    padding: 1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .logo-section {
    display: flex;
    align-items: center;
  }
  
  .logo-image {
    width: 3.5rem;
    height: 3.5rem;
    border-radius: 0.25rem;
    object-fit: cover;
    margin-right: 1rem;
  }
  
  .logo-text {
    font-family: 'Montserrat', sans-serif;
    font-weight: 700;
    font-size: 1.5rem;
    color: #2C3E50;
  }
  
  .nav-desktop {
    display: none;
  }
  
  .nav-link {
    color: #2C3E50;
    font-weight: 600;
    padding: 0.5rem 0.75rem;
    border-radius: 0.25rem;
    transition: all 0.2s ease;
  }
  
  .nav-link:hover {
    background-color: #f0f9ff;
    color: #E67E22;
  }
  
  .mobile-menu-button {
    display: flex;
    color: #2C3E50;
    padding: 0.5rem;
    border-radius: 0.25rem;
  }
  
  .mobile-menu {
    background: white;
    border-radius: 0 0 0.5rem 0.5rem;
    margin-top: 0.5rem;
    padding: 0.5rem;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  }
  
  .mobile-menu-link {
    display: block;
    padding: 0.75rem 1rem;
    color: #2C3E50;
    font-weight: 600;
    border-radius: 0.25rem;
    margin-bottom: 0.25rem;
  }
  
  .mobile-menu-link:hover {
    background-color: #f0f9ff;
    color: #E67E22;
  }
  
  .tagline {
    display: none;
    color: #6B7280;
    font-size: 0.875rem;
    margin-top: 0.25rem;
  }
  
  @media (min-width: 640px) {
    .logo-image {
      width: 4rem;
      height: 4rem;
    }
    
    .logo-text {
      font-size: 1.75rem;
    }
    
    .tagline {
      display: block;
    }
  }
  
  @media (min-width: 768px) {
    .nav-desktop {
      display: flex;
      align-items: center;
      gap: 1rem;
    }
    
    .mobile-menu-button {
      display: none;
    }
  }
</style>

<div class="header-container">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="header-content">
      <!-- Logo and title section -->
      <div class="logo-section">
        <img src="/images/FredsShedNZ.png" alt="Fred's Shed NZ Logo" class="logo-image" />
        <div>
          <div class="logo-text">Fred's Shed NZ</div>
          <div class="tagline">Fabrication, woodworking, cars, tools, boats, off grid, and adventure</div>
        </div>
      </div>
      
      <!-- Desktop navigation -->
      <nav class="nav-desktop">
        {#each sections as section}
          <a 
            href="#{section.id}" 
            class="nav-link"
          >
            {section.label}
          </a>
        {/each}
      </nav>
      
      <!-- Mobile menu button -->
      <button 
        class="mobile-menu-button"
        aria-label="Open main menu"
        on:click={toggleMenu}
      >
        {#if !isMenuOpen}
          <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        {:else}
          <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        {/if}
      </button>
    </div>
    
    <!-- Mobile menu -->
    {#if isMenuOpen}
      <div class="mobile-menu" transition:fade={{ duration: 200 }}>
        {#each sections as section}
          <a 
            href="#{section.id}" 
            class="mobile-menu-link"
            on:click={closeMenu}
          >
            {section.label}
          </a>
        {/each}
      </div>
    {/if}
  </div>
</div>
