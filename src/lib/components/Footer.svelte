<!-- src/lib/components/Footer.svelte -->
<script>
  const currentYear = new Date().getFullYear();
</script>

<footer class="bg-primary text-white py-8">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <div class="border-t border-gray-700 pt-6 mt-2">
      <div style="height: 20px;"></div><!-- Space before -->
      <div class="text-sm text-gray-400 mb-3">
        &copy; {currentYear} Fred's Shed NZ. All rights reserved.
      </div>
      
      <div>
        <p class="text-sm text-gray-400">
          Designed with ❤️  and built with a 🔨 in New Zealand
        </p>
      </div>

      <div>
        <p class="text-sm text-gray-400">
          Contribute to this site on
          <a
            href="https://github.com/FredsShedNZ/fredsshednz.com"
            target="_blank"
            rel="noopener noreferrer"
            class="text-gray-300 hover:text-white hover:scale-105 border-b border-gray-500 hover:border-white inline-flex items-center transition duration-150"
          >
            GitHub
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
            </svg>
          </a>
          via PR!
        </p>
      </div>
      <div style="height: 5px;"></div><!-- Space after -->
    </div>
  </div>
</footer>
