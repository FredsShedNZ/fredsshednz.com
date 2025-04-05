<!-- src/lib/components/Footer.svelte -->
<script>
  const currentYear = new Date().getFullYear();
</script>

<footer class="bg-primary text-white py-8">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <div class="border-t border-gray-700 pt-6 mt-2">
      <div class="text-sm text-gray-400 mb-3">
        &copy; {currentYear} Fred's Shed NZ. All rights reserved.
      </div>
      
      <div>
        <p class="text-sm text-gray-400">
          Designed with ❤️ and built with a 🔨 in New Zealand
        </p>
      </div>
    </div>
  </div>
</footer>
