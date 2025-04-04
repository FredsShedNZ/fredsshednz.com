<!-- src/lib/components/Footer.svelte -->
<script>
  const currentYear = new Date().getFullYear();
  
  let sections = [
    { id: 'watch', label: 'Watch' },
    { id: 'follow', label: 'Follow' },
    { id: 'support', label: 'Support' },
    { id: 'contact', label: 'Contact' }
  ];
</script>

<footer class="bg-primary text-white py-10">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex flex-col md:flex-row justify-between">
      <!-- Logo and tagline -->
      <div class="mb-8 md:mb-0">
        <div class="flex items-center">
          <svg class="w-8 h-8 mr-2" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 3L4 9V21H20V9L12 3Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M9 21V12H15V21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          <span class="text-2xl font-display font-bold">Fred's Shed NZ</span>
        </div>
        <p class="mt-2 text-sm text-gray-300 max-w-xs">
          Creating, building, and exploring from the workshop to the world.
        </p>
      </div>
      
      <!-- Navigation links -->
      <div class="grid grid-cols-2 gap-8 sm:grid-cols-2">
        <div>
          <h3 class="text-sm font-semibold text-secondary tracking-wider uppercase">Site Map</h3>
          <ul class="mt-4 space-y-2">
            {#each sections as section}
              <li>
                <a href="#{section.id}" class="text-gray-300 hover:text-white transition-colors duration-200">
                  {section.label}
                </a>
              </li>
            {/each}
          </ul>
        </div>
        
        <div>
          <h3 class="text-sm font-semibold text-secondary tracking-wider uppercase">Connect</h3>
          <ul class="mt-4 space-y-2">
            <li>
              <a href="https://youtube.com/@FredsShedNZ" class="text-gray-300 hover:text-white transition-colors duration-200">
                YouTube
              </a>
            </li>
            <li>
              <a href="https://www.instagram.com/fredsshed.nz" class="text-gray-300 hover:text-white transition-colors duration-200">
                Instagram
              </a>
            </li>
            <li>
              <a href="mailto:fredsshednz@proton.me" class="text-gray-300 hover:text-white transition-colors duration-200">
                Email
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    <div class="mt-8 pt-8 border-t border-gray-700 md:flex md:items-center md:justify-between">
      <div class="text-sm text-gray-400">
        &copy; {currentYear} Fred's Shed NZ. All rights reserved.
      </div>
      
      <div class="mt-4 md:mt-0">
        <p class="text-sm text-gray-400">
          Designed with 🔨 in New Zealand
        </p>
      </div>
    </div>
  </div>
</footer>