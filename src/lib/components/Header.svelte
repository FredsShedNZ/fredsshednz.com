<!-- src/lib/components/Header.svelte -->
<script>
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

<header class="bg-primary text-white shadow-lg sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <div class="flex items-center">
        <div class="text-2xl md:text-3xl font-display font-bold">
          <a href="/" class="flex items-center">
            <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 3L4 9V21H20V9L12 3Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M9 21V12H15V21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Fred's Shed NZ
          </a>
        </div>
      </div>
      
      <!-- Mobile menu button -->
      <div class="flex items-center sm:hidden">
        <button 
          type="button" 
          class="inline-flex items-center justify-center p-2 rounded-md text-white hover:text-white hover:bg-primary-light focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" 
          aria-controls="mobile-menu" 
          aria-expanded="false"
          on:click={toggleMenu}
        >
          <span class="sr-only">Open main menu</span>
          <!-- Icon when menu is closed -->
          <svg 
            class={!isMenuOpen ? 'block h-6 w-6' : 'hidden h-6 w-6'} 
            xmlns="http://www.w3.org/2000/svg" 
            fill="none" 
            viewBox="0 0 24 24" 
            stroke="currentColor" 
            aria-hidden="true"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
          <!-- Icon when menu is open -->
          <svg 
            class={isMenuOpen ? 'block h-6 w-6' : 'hidden h-6 w-6'} 
            xmlns="http://www.w3.org/2000/svg" 
            fill="none" 
            viewBox="0 0 24 24" 
            stroke="currentColor" 
            aria-hidden="true"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      
      <!-- Desktop menu -->
      <nav class="hidden sm:flex space-x-8 items-center">
        {#each sections as section}
          <a 
            href="#{section.id}" 
            class="text-white hover:text-secondary font-medium transition-colors duration-200"
          >
            {section.label}
          </a>
        {/each}
      </nav>
    </div>
  </div>

  <!-- Mobile menu, show/hide based on menu state -->
  {#if isMenuOpen}
    <div class="sm:hidden bg-primary-light" id="mobile-menu" transition:fade={{ duration: 200 }}>
      <div class="px-2 pt-2 pb-3 space-y-1">
        {#each sections as section}
          <a 
            href="#{section.id}" 
            class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-primary-dark"
            on:click={closeMenu}
          >
            {section.label}
          </a>
        {/each}
      </div>
    </div>
  {/if}
</header>
